# frozen_string_literal: true

FactoryBot.define do

  factory :property do
    property_type { 'apartment' }
    offer_type { 'sell' }
    zip_code { 10405 }
    city { "Berlin" }
    street { "Prenzlauer Allee" }
    house_number { 36 }
    lng { 52.5346344 }
    lat { 13.4224666 }
    price { 239500.0 }
  end

end
