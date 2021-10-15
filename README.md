# README

This service returns a list of properties within a `5 kilometer` radius of a given cordinates along with their addresses and price.

* Ruby version
2.7.2

* Database creation

Run rails db:create
Run bundle exec rails db < properties.sql

* How to run the app
Run rails s

call `/properties/near` endpoint with the following params;
params:
  - `lng` : `13.4236807`
  - `lat` : `52.5342963`
  - `property_type` : `apartment`
  - `marketing_type` : `sell`

you should get a sample response as follows;

```
[
  {
      "id": 326809,
      "house_number": "36",
      "street": "Prenzlauer Allee",
      "city": "Berlin",
      "zip_code": "10405",
      "lat": "52.5346344",
      "lng": "13.4224666",
      "price": "239500.0",
      "state": "Berlin"
  },
  {
      "id": 5414869,
      "house_number": null,
      "street": null,
      "city": "Berlin",
      "zip_code": "10405",
      "lat": "52.5327964",
      "lng": "13.4225659",
      "price": "589000.0",
      "state": "Berlin"
  },
  {
      "id": 357836,
      "house_number": null,
      "street": null,
      "city": "Berlin",
      "zip_code": "10405",
      "lat": "52.5327964",
      "lng": "13.4225659",
      "price": "142900.0",
      "state": "Berlin"
  }
]

* How to run the test suite
Run rspec spec


* Decisions
This service uses [geocoder gem](https://github.com/alexreisner/geocoder) for converting addresses and coordinates and finding nearby locations.

The testing tool for this service is Rspec


