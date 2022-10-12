# frozen_string_literal: true

class SearchRequest < ApplicationRecord
  validates :query, presence: true
  belongs_to :location
  validates_associated :location

  before_create :normalize_query

  def normalize_query
    self.query = query.strip.downcase
  end
end
