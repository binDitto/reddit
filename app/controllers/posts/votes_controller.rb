class Posts::VotesController < VotesController
  before_action :set_voteable


  private

  def set_voteable
    @voteable = Post.find(params[:post_id])
  end

end
