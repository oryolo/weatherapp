# frozen_string_literal: true

class Location < ApplicationRecord
  has_many :weather_records
  has_many :weather_forecasts
  has_many :search_requests
end
