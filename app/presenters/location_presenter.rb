# frozen_string_literal: true

class LocationPresenter
  attr_reader :location
  attr_accessor :current_weather, :current_weather_cached, :weather_forecasts, :weather_forecasts_cached

  def initialize(location)
    @location = location
  end

  def self.call(location)
    new(location).call
  end

  def call
    weather_records
    weather_forecasts
    self
  end

  def location_name
    if location.city
      "#{location.city}, #{location.state}, #{location.country}"
    else
      "zip #{location.postcode}"
    end
  end

  private

  def weather_records
    self.current_weather, self.current_weather_cached = WeatherProvider.new(location).current_weather
  end

  def weather_forecasts
    self.weather_forecasts, self.weather_forecasts_cached = WeatherProvider.new(location).weather_forecasts
  end
end
