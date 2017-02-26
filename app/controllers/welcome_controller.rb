class WelcomeController < ApplicationController
  def index
    @posts = Post.all.order("created_at ASC").limit(2).sort_by(&:score).reverse
  end
end
