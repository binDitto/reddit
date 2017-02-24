class Users::PostsController < PostsController
  before_action :set_user_show_posts

  def index
    @posts = @user.posts
  end

  private

  def set_user_show_posts
    @user = User.find(params[:user_id])
  end


end
