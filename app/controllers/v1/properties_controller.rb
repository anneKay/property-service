class V1::PropertiesController < ApplicationController
  
  def get_near_by_properties
    property_attributes = PropertyValidator.new(property_params)
  
    if property_attributes.valid?
      @properties = Property.find_near_by_properties(params)
      render json: { message: 'No nearby properties found at this time' }, status: 404 and return if @properties.blank?

      render json: @properties, status: 200
    else
      render json: property_attributes.errors, status: 422
    end
  end

private

  def property_params
    params.permit(:lng, :lat, :property_type, :marketing_type)
  end
end
