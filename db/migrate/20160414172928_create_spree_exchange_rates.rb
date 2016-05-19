class CreateSpreeExchangeRates < ActiveRecord::Migration
  def change
    create_table :spree_exchange_rates do |t|
      t.string :code, index: true
      t.float :value
      t.timestamps null: false
    end

    Spree::ExchangeRate.fetch_updates
  end
end
