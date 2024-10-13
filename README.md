# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
  Ruby version used is 2.7
  Rails version used is 5.2.8

* Application Flow
  - This is a simple weather forecast application.  

  Here we can show the dummy static response as well but I used OpenWeatherMap API to fetch the address based weather details. Integrated OpenWeatherMap API to fetch weather forecast details.

  - When user visits root path (localhost:3000), page will shown to user where address and zipcode is asked to used for which he want to check weather forecast.

  - On click of submit, Current temprature, High, Low, sunrise, sunset in UTC displayed as a result.

* Application Structure
  - Controllers
    HomeController - Application root path defined which shows default page with address and zipcode form should be displayed to user.

    ForeCastController - POST action defined which calls after address submission which fetches cached data or restored data of weather forecast.

  - Model/Concerns
    OpenWeatherApi - OpenWeather API call is defined in a module OpenWeatherApi which returns response in ruby Hash. We can use these module methods when required in other places as well.

  - Views
    All the html pages of an application are in app/views. 

  - Used Rails.cache for caching the forecast details as per requirment. Forecast details Cached for 30 minutes for all subsequent requests by zip codes. Notification message shown as a indicator if result is pulled from cache or else result is restored.

* OpenWeatherMap API Configuration
  - OpenWeatherMap API configurations are saved in config/settings.yml
  - OpenWeatherMap API  needs API Key to use the services. I used a Free trial of this service and added a API KEY and  required API urls to fetch forecast result.

* Github libraries used
  - gem 'config' used to configure all required configuration values in yml file

* UI
  - Bootstrap CSS used for basic UI 

* Database creation - No database setup needed

* How to run the test suite
  - Unit tests added to check address form validation and redirection using Rspec. Test cases are saved in /spec/requests/forecast_spec.rb

  - To run test please run below command: rspec spec

* To run Project
  - Run bundle install in a project diretory
  - Rename /config/settings.yml.dev with settings.yml.
  - Replace api_key in settings.yml with your OpenWeatherApi key.
  - Start the Rails server.

