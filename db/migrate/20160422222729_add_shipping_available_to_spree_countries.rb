class AddShippingAvailableToSpreeCountries < ActiveRecord::Migration
  def change
    add_column :spree_countries, :shipping_available, :boolean, :default => true
    change_column_null :spree_countries, :shipping_available, false
    add_index :spree_countries, :shipping_available
  end
end
