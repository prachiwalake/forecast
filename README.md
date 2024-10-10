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

- When user visits root path, page will shown to user where address and zipcode is asked to used for which he want to check weather forecast.

- On click of submit, Current temprature, High, Low, sunrise, sunset in UTC displayed as a result.

- Forecast details Cached for 30 minutes for all subsequent requests by zip codes. Notification message shown as a indicator if result is pulled from cache or else result is restored.

* Configuration
- OpenWeatherMap API configurations are saved in config/settings.yml
- OpenWeatherMap API  needs API Key to use the services. I used a Free trial of this service and added a API KEY and  required API urls to fetch forecast result.

* Github libraries used
- gem 'config' used to configure all required configuration values in yml file

* UI
- Bootstrap CSS used for basic UI 

* Database creation - No database setup needed

* How to run the test suite

