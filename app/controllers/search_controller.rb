# frozen_string_literal: true

class SearchController < ApplicationController
  def create
    location = LocationLookup.call(search_params[:query])

    if location
      redirect_to location
    else
      redirect_to root_path, notice: "Sorry, we couldn't find any weather data for this request. Try to search again"
    end
  end

  private

  def search_params
    params.permit(:query)
  end
end
