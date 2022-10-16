# frozen_string_literal: true

class LocationLookup
  attr_reader :query, :location_data

  def initialize(query)
    @query = query.strip.downcase
  end

  def self.call(query)
    new(query).call
  end

  def call
    if sr = SearchRequest.find_by(query: query)
      sr.location
    else
      create_search_request!
    end
  end

  private

  def create_search_request!
    return unless location_data

    lat, lon = location_data.coordinates
    location = Location.find_by(lat: lat, lon: lon) || create_location!(location_data, lat, lon)
    location.search_requests.create!(query: query)
    location
  end

  def create_location!(location_data, lat, lon)
    Location.create!(
      lat: lat,
      lon: lon,
      city: location_data.city,
      state: location_data.state,
      country: location_data.country,
      postcode: location_data.data.dig("properties", "postcode")
    )
  end

  def location_data
    @location_data ||= Geocoder.search(query, params: {filter: "countrycode:us"})&.first
  end
end
