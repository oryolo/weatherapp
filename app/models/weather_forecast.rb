# frozen_string_literal: true

class WeatherForecast < ApplicationRecord
  belongs_to :location
  validates_associated :location
end
