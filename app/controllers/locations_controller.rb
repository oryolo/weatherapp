# frozen_string_literal: true

class LocationsController < ApplicationController
  def show
    location = Location.find(params[:id])
    @presenter = LocationPresenter.call(location)
  end
end
