require "rails_helper"

RSpec.describe WeatherProvider do
  let(:location) { create(:location) }
  let(:current_weather_data) {
    {
      main: {
        temp: 298.48,
        feels_like: 298.74,
        temp_min: 297.56,
        temp_max: 300.05,
        pressure: 1015,
        humidity: 64,
        sea_level: 1015,
        grnd_level: 933
      }
    }
  }

  subject { WeatherProvider.new(location) }

  it "#current_weather" do
    expect_any_instance_of(WeatherProvider).to receive(:get_current_weather) { current_weather_data }
    expect { subject.current_weather }.to change { WeatherRecord.count }.by(1)
  end
end
