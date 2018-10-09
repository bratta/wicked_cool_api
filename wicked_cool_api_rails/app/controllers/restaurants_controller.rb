class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :update, :destroy]

  # GET /restaurants
  def index
    @restaurants = Restaurant.all
    json_response(@restaurants)
  end

  # GET /restaurants/:id
  def show
    json_response(@restaurant)
  end

  # POST /restaurants
  def create
    @restaurant = Restaurant.create!(restaurant_params)
    json_response(@restaurant, :created)
  end

  # PUT /restaurants/:id
  def update
    @restaurant.update(restaurant_params)
    head :no_content
  end

  # DELETE /restaurants/:id
  def destroy
    @restaurant.destroy
    head :no_content
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.permit(:name, :price_level, :rating, :address1, :address2, :city, :state, :zipcode, :phone, :created_at, :updated_id)
  end
end
