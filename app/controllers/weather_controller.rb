class WeatherController < ApplicationController
  skip_before_action :authenticate_user, only: [:show]
  def show
    # byebug
    @weather_object = WeatherService.new('b1caf21f17a1d43c7c22490a53aed12a')
    @weather_data = @weather_object.get_weather_by_city(params[:city])
    render json: @weather_data 
  rescue StandardError => e 
    render json: {error: "FAILED TO FETCH THE DATA: #{e.message}"}, status: :unprocessable_entity
  end
end

# https://api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}