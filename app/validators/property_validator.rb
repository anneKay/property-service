class PropertyValidator
  include ActiveModel::Model

  attr_accessor :lat, :lng, :marketing_type, :property_type

  validates :lat, :lng, presence: true, numericality: true
  validates :marketing_type, inclusion: { in: %w(rent sell), allow_blank: true, message: 'Invalid marketing search type' }
  validates :property_type, inclusion: { in: %w(apartment single_family_house), allow_blank: true, message: 'Invalid property search type' }
  
end