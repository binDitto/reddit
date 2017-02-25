class Posts::VotesController < VotesController
  before_action :set_votable


  private

  def set_votable
    @voteable = Post.find(params[:post_id])
  end

end
