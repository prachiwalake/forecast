class ForecastController < ApplicationController
  def check_weather
    if params[:address].blank?
      @response  = {:status=>"error", :message=>"Please enter valid address"}
    else
      @response = OpenWeatherApi.get_current_weather(params[:address])
    end
  end
end