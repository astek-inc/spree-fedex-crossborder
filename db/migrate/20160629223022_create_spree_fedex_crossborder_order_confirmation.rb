class CreateSpreeFedexCrossborderOrderConfirmation < ActiveRecord::Migration
  def change
    create_table :spree_fedex_crossborder_order_confirmations do |t|
      t.string :order_number
      t.text :raw_data
      t.timestamps null: false
    end

    add_index :spree_fedex_crossborder_order_confirmations, :order_number, name: 'idx_order_number'
    add_foreign_key :spree_fedex_crossborder_order_confirmations, :spree_orders, column: :order_number, primary_key: :number, name: 'fk_order_number'
  end
end
