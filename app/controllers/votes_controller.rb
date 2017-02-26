class VotesController < ApplicationController
  before_action :require_user

  def create
    @vote = @voteable.votes.new(vote_params)
    @vote.user = current_user if current_user

    if @voteable.votes.where(user: current_user, amount: 1).exists? || @voteable.votes.where(user: current_user, amount: -1).exists?
      @existing_vote = Vote.find_by(voteable_id: @voteable.id)
      @existing_vote.destroy
      flash[:danger] = "You've removed your vote!"
      redirect_to :back
    else
      if @vote.save
        flash[:success] = "Thanks #{current_user.username.capitalize}"
        respond_to do |format|
          format.html { redirect_to :back }
          format.js
        end
      else
        flash[:danger] = "Something went wrong"
        redirect_to :back
      end
    end
  end

  private

  def vote_params
    params.require(:vote).permit(:amount)
  end
end
