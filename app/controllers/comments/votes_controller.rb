class Comments::VotesController < VotesController
  before_action :set_voteable


  private

  def set_voteable
    @voteable = Comment.find(params[:comment_id])
  end

end
