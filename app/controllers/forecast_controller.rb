class ForecastController < ApplicationController
  def check_weather
    if params[:address].blank? || params[:zipcode].blank?
      flash[:error] = "Please enter valid address and zipcode"
      redirect_to :root and return
    else
      @response = OpenWeatherApi.fetch_weather_data(params[:address], params[:zipcode])
    end
  end
end