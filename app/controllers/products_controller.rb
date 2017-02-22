class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
    @reviews = @product.reviews.order(created_at: :desc)
    @new_review = @product.reviews.new
    @ratings = @product.total_rating
    @avg_rating = @product.avg_rating if @product.has_reviews? 
  end

end
