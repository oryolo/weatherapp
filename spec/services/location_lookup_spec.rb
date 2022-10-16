require "rails_helper"

RSpec.describe LocationLookup do
  let(:coordinates) { [-74.0060152, 40.7127281] } # NY coordinates
  let(:location_data) { double("location_data", coordinates: coordinates, city: "New York", state: "New York", country: "US", data: {}) }
  let(:query) { "New York" }
  let(:call) { described_class.call(query) }

  context "when a search request is not cached" do
    it "redirects to location" do
      allow_any_instance_of(LocationLookup).to receive(:location_data).and_return(location_data)
      expect(SearchRequest.count).to eq(0)
      expect(Location.count).to eq(0)

      expect(call).to eq(Location.last)

      expect(SearchRequest.count).to eq(1)
      expect(Location.count).to eq(1)
    end
  end

  context "when a search request is cached" do
    let(:location) { create(:location) }
    let!(:search_request) { create(:search_request, query: query, location: location) }

    it "redirects to location" do
      expect_any_instance_of(LocationLookup).to_not receive(:location_data)
      expect(SearchRequest.count).to eq(1)
      expect(Location.count).to eq(1)

      expect(call).to eq(location)

      expect(SearchRequest.count).to eq(1)
      expect(Location.count).to eq(1)
    end
  end
end
