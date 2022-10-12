# frozen_string_literal: true

class WeatherRecord < ApplicationRecord
  belongs_to :location
  validates_associated :location
end
