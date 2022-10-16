## Weather Service

This service provides information about the current weather and weather forecasts
for a specific address (location, city, zip, etc.) requested by a user.

## Development Setup

1 .Clone repository to your working directory with:
```shell
git clone git@github.com:oryolo/weatherapp.git 
```

2. Install dependencies with:
```shell
bundle install
```

3. Create `config/master.key` file and insert and save it with the master key secret that you were provided with.


4. Setup the database with:
```shell
bundle exec rails db:setup
```

5. Run the development server:

```shell
bundle exec rails s
```

6. Now you can open a browser and navigate to http://localhost:3000 to use the service.

## Development Notes

### Data Providers

* OpenWeather API [documentation](https://openweathermap.org/api)
* GeoApify API [documentation](https://apidocs.geoapify.com/)

### Data Modeling

`SearchRequest` - stores user requests as a normalized string(downcased, stripped).

`Location` - stores geo coordinates, city name, state, and other geo properties.

`WeatherRecord` - stores fetched current weather data and used as a cache store.

`WeatherForecast` - stores weather forecast data (requires a premium subscription to OpenWeather API).

### Service Classes

`LocationLookup` - tracks search requests and manages geo locations(using gem 'geocoder' and Geoapify API)

`WeatherProvider` - fetches weather data from the OpenWeather API.

### Restrictions and limitations

* Currently, only US addresses are supported.
* Weather cache threshold is set to 30 minutes per geo location. 

## Running Tests

Run tests with the following command:

```shell
bundle exec rspec
```

## Screenshots

<img src="https://user-images.githubusercontent.com/26096960/196049979-cbb96bf4-f34b-46e0-8553-b5f1ab3cd34a.png" width="200">
<img src="https://user-images.githubusercontent.com/26096960/196049970-3e612fe3-f6de-4ed5-bdbb-45ae7ec4030f.png" width="200">

## Production Setup

TBD

