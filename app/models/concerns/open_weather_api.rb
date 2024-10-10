require 'net/http'
require 'uri'

module OpenWeatherApi
  extend ActiveSupport::Concern

  class << self
    def call_api(url)
      begin
        uri = URI.parse(url)
        response = Net::HTTP.get_response(uri)
        binding.pry
        response_data = JSON.parse(response.body)
        if response_data["cod"] == 200 && response_data["weather"].present?
          return {status: "success", code: response_data["cod"], message: "weather forecast fetched successfully", data: response_data}
        else
          return {status: "success", code: response_data["cod"], message: response_data["message"]}
        end
      rescue Exception => e
        Rails.logger.info "Encountered an error in OpenWeatherApp api #{url}: #{e.message} #{e.backtrace.join('\n')}"
        return {status: "error", message: "Somthing went wrong"}
      end
    end

    def get_current_weather(address)
      begin
        url = Settings.open_weather.base_url + Settings.open_weather.weather_data_api_url + "?q=#{address}&APPID=#{Settings.open_weather.api_key}&units=imperial"
        binding.pry
        response = OpenWeatherApi.call_api(url)
      rescue Exception => e
        Rails.logger.infor "Encountered an error in fetching weather report #{e.message} #{e.backtrace.join('\n')}"
        return {status: "error", message: "Somthing went wrong"}
      end
    end
  end
end 