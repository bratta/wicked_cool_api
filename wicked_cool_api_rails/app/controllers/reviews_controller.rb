class ReviewsController < ApplicationController
  before_action :set_restaurant
  before_action :set_review, only: [:show, :update, :destroy]

  # GET /restaurants/:restaurant_id/reviews
  def index
    json_response(@restaurant.reviews)
  end

  # GET /restaurants/:restaurant_id/reviews/:id
  def show
    json_response(@review)
  end

  # POST /restaurants/:restaurant_id/reviews
  def create
    @restaurant.reviews.create!(review_params)
    json_response(@review, :created)
  end

  # PUT /restaurants/:restaurant_id/reviews/:id
  def update
    @restaurant.update(review_params)
    head :no_content
  end

  # DELETE /restaurants/:restaurant_id/reviews/:id
  def destroy
    @review.destroy
    head :no_content
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def set_review
    @review = @restaurant.reviews.find_by!(id: params[:id]) if @restaurant
  end

  def review_params
    params.permit(:username, :body, :rating, :created_at, :updated_at)
  end
end
