class CreateLocations < ActiveRecord::Migration[7.0]
  def change
    create_table :locations do |t|
      t.decimal :lat, :precision => 15, :scale => 10, index: true
      t.decimal :lon, :precision => 15, :scale => 10, index: true
      t.string :city
      t.string :state
      t.string :country
      t.string :postcode
      t.timestamps
    end

    create_table :search_requests do |t|
      t.string :query
      t.belongs_to :location, index: true, foreign_key: true
      t.timestamps
    end

    create_table :weather_records do |t|
      t.decimal :temp
      t.decimal :feels_like
      t.decimal :temp_min
      t.decimal :temp_max
      t.belongs_to :location, index: true, foreign_key: true
      t.timestamps
    end

    create_table :weather_forecasts do |t|
      t.decimal :temp
      t.decimal :feels_like
      t.decimal :temp_min
      t.decimal :temp_max
      t.belongs_to :location, index: true, foreign_key: true
      t.timestamps
    end
  end
end
