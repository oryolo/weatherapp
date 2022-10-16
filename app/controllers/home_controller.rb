# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @locations = Location.limit(10).order("created_at DESC")
  end
end
