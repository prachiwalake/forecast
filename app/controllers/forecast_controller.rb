class ForecastController < ApplicationController
  ## check_weather method get the address and zipcode and calls openWeatherApi to get weather details which is cached as per zipcode for 30 minutes.
  def check_weather
    if params[:address].blank? || params[:zipcode].blank?
      flash[:error] = "Please enter valid address and zipcode"
      redirect_to :root and return
    else
      ## fetch weather details,It will returns hash which includes respnse status, status_code and weather summary details as response of OpenWeather api call.
   
      @response = OpenWeatherApi.fetch_weather_data(params[:address], params[:zipcode])
    end
  end
end