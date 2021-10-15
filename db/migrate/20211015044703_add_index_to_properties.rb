class AddIndexToProperties < ActiveRecord::Migration[6.1]
  def change
    add_index :properties, [:lat, :lng, :offer_type, :property_type], name: 'properties_index'
  end
end
