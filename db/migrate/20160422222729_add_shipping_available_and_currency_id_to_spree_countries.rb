class AddShippingAvailableAndCurrencyIdToSpreeCountries < ActiveRecord::Migration
  def change
    add_column :spree_countries, :shipping_available, :boolean, :default => true
    change_column_null :spree_countries, :shipping_available, false
    add_index :spree_countries, :shipping_available

    add_column :spree_countries, :currency_id, :integer
    add_foreign_key :spree_countries, :spree_currencies, column: :currency_id, primary_key: :id
    add_index :spree_countries, :currency_id
  end
end
