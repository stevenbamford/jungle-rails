class ReviewsController < ApplicationController

  before_filter :authorize

  def create
    @product = Product.find params[:product_id]
    @new_review = @product.reviews.new(review_params)
    @new_review.user_id = current_user.id

    if @new_review.save
      redirect_to [@product], notice: 'Review created!'
    else
      redirect_to [@product],  notice: 'There was a problem adding your review.'
    end
  end

  def destroy
    @product = Product.find params[:product_id]
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to [@product]
  end


  private
    def review_params
      params.require(:review).permit(
          :description,
          :rating,
        )
    end
end
