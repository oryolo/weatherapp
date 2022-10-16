# frozen_string_literal: true

class WeatherProvider
  attr_reader :location

  CACHE_THRESHOLD = 30.minutes.freeze

  def initialize(location)
    @location = location
  end

  def current_weather
    return [cached_record, true] if cached_record

    data = get_current_weather
    record = location.weather_records.create!(data.slice("temp", "feels_like", "temp_min", "temp_max"))
    [record, false]
  end

  def weather_forecasts
    # FIXME: forecast data available only for premium subscription
    # get_forecasts
  end

  private

  def connection
    Faraday.new(url: "https://api.openweathermap.org", headers: {"Content-Type" => "application/json"})
  end

  def get_current_weather
    res = connection.get("/data/2.5/weather", params)
    JSON.parse(res.body)["main"]
  end

  def get_forecasts
    # FIXME: forecast data available only for premium subscription
    # connection.get("/data/2.5/forecast/daily", params)
  end

  def cached_record
    location.weather_records.where("created_at > ?", CACHE_THRESHOLD.ago).order("created_at DESC").first
  end

  def params
    {
      lat: location.lat.round(2),
      lon: location.lon.round(2),
      units: "imperial",
      appId: Rails.application.credentials[Rails.env.to_sym][:openweather_api_key]
    }
  end
end
