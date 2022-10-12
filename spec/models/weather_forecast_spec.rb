require "rails_helper"

RSpec.describe WeatherForecast, type: :model do
  let(:weather_forecast) { build(:weather_record, location: create(:location)) }

  it "is valid with valid attributes" do
    expect(weather_forecast).to be_valid
  end
end
