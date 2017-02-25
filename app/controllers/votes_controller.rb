class VotesController < ApplicationController
  before_action :require_user 

  def create
    @vote = @voteable.votes.new(vote_params)
    @vote.user = current_user if current_user
  end

  private

  def vote_params
    params.require(:vote).permit(:amount)
  end
end
