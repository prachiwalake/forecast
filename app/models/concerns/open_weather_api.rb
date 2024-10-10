require 'net/http'
require 'uri'

module OpenWeatherApi
  extend ActiveSupport::Concern

  class << self
    ## fetch weather data. First check for cache if not exists then call API
    def fetch_weather_data(address, zipcode)
      fetched_from_cache = Rails.cache.exist?("#{zipcode}")
      result = Rails.cache.fetch("#{zipcode}", expires_in: 30.minutes) do
        OpenWeatherApi.get_current_weather(address, zipcode)
      end
      result[:message] = "Weather forecast data fetched from Cache." if fetched_from_cache
      return result
    end

    ## net_http logic to get response
    def call_api(url, zipcode)
      begin
        uri = URI.parse(url)
        response = Net::HTTP.get_response(uri)
        response_data = JSON.parse(response.body)
        if response_data["cod"] == 200 && response_data["weather"].present?
          return  {status: "success", code: response_data["cod"], message: "weather forecast data restored.", data: response_data}
        else
          return {status: "success", code: response_data["cod"], message: response_data["message"]}
        end
      rescue Exception => e
        Rails.logger.info "Encountered an error in OpenWeatherApp api #{url}: #{e.message} #{e.backtrace.join('\n')}"
        return {status: "error", message: "Somthing went wrong"}
      end
    end

    ## get OpenWeather API url configured in settings.yml and get the weather response for requested address and zipcode in imperial units
    def get_current_weather(address, zipcode)
      begin
        url = Settings.open_weather.base_url + Settings.open_weather.weather_data_api_url + "?q=#{address}&APPID=#{Settings.open_weather.api_key}&units=imperial"
        response = OpenWeatherApi.call_api(url, zipcode)
      rescue Exception => e
        Rails.logger.infor "Encountered an error in fetching weather report #{e.message} #{e.backtrace.join('\n')}"
        return {status: "error", message: "Somthing went wrong"}
      end
    end
  end
end 