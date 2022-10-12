require "rails_helper"

RSpec.describe Location, :type => :model do
  let(:location) { build(:location) }

  it "is valid with valid attributes" do
    expect(location).to be_valid
  end
end