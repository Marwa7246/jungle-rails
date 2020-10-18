class ReviewsController < ApplicationController
  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)
    @review.user = current_user
    if @review.save
      redirect_to [:root]
    else
      redirect_to product_path(@product)

    end
    # byebug
  end

  def destroy
    @product = Product.find(params[:product_id])
    @review = @product.reviews.find(params[:id])
    @review.destroy
    redirect_to [:root]


    byebug
  end

  private
  def review_params 
    params.require(:review).permit(:description, :rating)
  end
end
