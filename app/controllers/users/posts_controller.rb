class Users::PostsController < PostsController
  before_action :set_user_show_posts

  def index
    @user_posts = @user.posts.order("posts.created_at ASC").sort_by(&:score).reverse
  end

  private

  def set_user_show_posts
    @user = User.find(params[:user_id])
  end


end
