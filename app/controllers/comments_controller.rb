class CommentsController < ApplicationController
  before_action :require_user, except: [ :index ]

  def index
    @user = User.find(params[:user_id])
    @comments = @user.comments
  end
  def create
    @comment = @commentable.comments.new(set_params)
    @comment.user = current_user if current_user

    if @comment.save
      flash[:success] = "Your comment went though! YEAHHH!"
      redirect_to :back
    else
      flash[:danger] = "Comment FAILLLL"
      redirect_to :back
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:danger] = "Comment removed."
    redirect_to :back
  end

  private

    def set_params
      params.require(:comment).permit(:body)
    end

end
