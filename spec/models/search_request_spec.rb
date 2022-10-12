require "rails_helper"

RSpec.describe SearchRequest, type: :model do
  let(:search_request) { build(:search_request, location: create(:location)) }

  it "is valid with valid attributes" do
    expect(search_request).to be_valid
  end
end
