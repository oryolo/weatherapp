FactoryBot.define do
  factory :weather_forecast do
    temp { 68 }
    temp_min { 64 }
    temp_max { 70 }
    feels_like { 68 }
  end
end
