# frozen_string_literal: true

class Property < ApplicationRecord
  MAXIMUM_PROPERTY_DISTANCE = 5

  validates :lat, :lng, presence: true, numericality: true

  scope :find_near_by_properties, -> (params) { 
    find_by_location(params).
    find_by_marketing_type(params['marketing_type']).
    find_by_property_type(params['property_type'])
  }
  scope :find_by_location, -> (params) { near([params['lat'], params['lng']], MAXIMUM_PROPERTY_DISTANCE, units: :km) }
  scope :find_by_marketing_type, -> (marketing_type) { where(offer_type: marketing_type) if marketing_type.present? }
  scope :find_by_property_type, -> (property_type) { where(property_type: property_type) if property_type.present? }

  geocoded_by :address, latitude: :lat, longitude: :lng
  
private

  def address
    [street, city, country].compact.join(', ')
  end
end
