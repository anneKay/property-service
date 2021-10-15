class PropertySerializer < ActiveModel::Serializer
  attributes :id, :house_number, :street, :city, :zip_code, :lat, :lng, :price, :state

  def state
    object&.city
  end
end
