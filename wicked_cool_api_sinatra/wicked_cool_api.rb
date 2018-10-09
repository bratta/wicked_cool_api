require 'json'

######################################
# ActiveRecord Models are here.
# Please don't do this for real.
# Separate files make much more sense.
######################################

class Restaurant < ActiveRecord::Base
  has_many :reviews
end

class Review < ActiveRecord::Base
  belongs_to :restaurant
end

##############################
# Main Sinatra API Application
##############################

class WickedCoolApi < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  before do
    content_type 'application/json'
  end

  helpers do
    def base_url
      @base_url ||= "#{request.env['rack.url_scheme']}://#{request.env['HTTP_HOST']}"
    end

    def json_params
      begin
        request.body.rewind
        JSON.parse(request.body.read)
      rescue
        halt 400, { message: 'Invalid JSON' }.to_json
      end
    end
  end
  
  get '/restaurants' do
    @restaurants = Restaurant.all
    @restaurants.to_json
  end

  get '/restaurants/:id' do |id|
    @restaurant = Restaurant.find_by_id(id)
    halt(404, { message: 'Restaurant Not Found' }.to_json) unless @restaurant
    @restaurant.to_json
  end

  # PUT   = complete document replacement
  # PATCH = updating existing document
  patch '/restaurants/:id' do |id|
    @restaurant = Restaurant.find_by_id(id)
    halt(404, { message: 'Restaurant Not Found' }.to_json) unless @restaurant
    if @restaurant.update(json_params)
      @restaurant.to_json
    else
      status 422
      @restaurant.to_json
    end
  end

  post '/restaurants' do
    @restaurant = Restaurant.new(json_params)
    if @restaurant.save
      response.headers['Location'] = "#{base_url}/restaurants/#{@restaurant.id}"
      status 201
    else
      status 422
      @restaurant.to_json
    end
  end

  delete '/restaurants/:id' do |id|
    @restaurant = Restaurant.find_by_id(id)
    @restaurant.destroy if @restaurant
    status 204
  end

  get '/restaurants/:id/reviews' do |id|
    @restaurant = Restaurant.find_by_id(id)
    halt(404, { message: 'Restaurant Not Found' }.to_json) unless @restaurant
    @reviews = @restaurant.reviews
    @reviews.to_json
  end

  get '/restaurants/:restaurant_id/reviews/:id' do |restaurant_id, id|
    @review = Review.where(restaurant_id: restaurant_id, id: id).first
    halt(404, { message: 'Review Not Found' }.to_json) unless @review
    @review.to_json
  end

  patch '/restaurants/:restaurant_id/reviews/:id' do |restaurant_id, id|
    @review = Review.where(restaurant_id: restaurant_id, id: id).first
    halt(404, { message: 'Review Not Found' }.to_json) unless @review
    if @review.update(json_params)
      @review.to_json
    else
      status 422
      @review.to_json
    end
  end

  post '/restaurants/:id/reviews' do |id|
    @restaurant = Restaurant.find_by_id(id)
    halt(404, { message: 'Restaurant Not Found' }.to_json) unless @restaurant
    @review = @restaurant.reviews.build(json_params)
    if @review.save
      response.headers['Location'] = "#{base_url}/restaurants/#{@restaurant.id}/reviews/#{@review.id}"
      status 201
    else
      status 422
      @review.to_json
    end
  end

  delete '/restaurants/:restaurant_id/reviews/:id' do |restaurant_id, id|
    @review = Review.where(restaurant_id: restaurant_id, id: id).first
    @review.destroy if @review
    status 204
  end
end
