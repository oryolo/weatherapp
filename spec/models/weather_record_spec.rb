require "rails_helper"

RSpec.describe WeatherRecord, type: :model do
  let(:weather_record) { build(:weather_record, location: create(:location)) }

  it "is valid with valid attributes" do
    expect(weather_record).to be_valid
  end
end
