class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
    @reviews = Review.where(product_id: @product.id).sort { |a,b| b.created_at <=> a.created_at }
    @new_review = Review.new(product: @product)
    @ratings = 0
    @reviews.each do |review|
      @ratings += review.rating
    end
    @avg_rating = @ratings / @reviews.length
  end

end
