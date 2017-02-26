class CategoriesController < ApplicationController
  before_action :set_category, only: [ :show, :edit, :update, :destroy ]
  before_action :require_cat, only: [ :index, :show, :edit, :update, :destroy]
  before_action :require_user, except: [ :index, :show ]

  def index
    @categories = Category.all.sort
  end

  def new
    @category = Category.new()
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      flash[:success] = "#{@category.name} category created!"
      redirect_to categories_path
    else
      flash[:danger] = "Failed to save category"
      redirect_to :back
    end
  end

  def show

  end

  def edit

  end

  def update
    if @category.update(category_params)
      flash[:success] = "#{@category.name} updated!"
      redirect_to categories_path
    else
      flash[:danger] = "Update failed!"
      redirect_to :back
    end
  end

  def destroy
    @category.destroy
    flash[:success] = "Category Removed!"
    redirect_to categories_path
  end
  private

  def category_params
    params.require(:category).permit(:name)
  end

  def set_category
    @category = Category.find(params[:id])
  end

  def require_cat
    unless Category.any?
      flash[:danger] = "No Categories please create one."
      redirect_to new_category_path
    end
  end
end
