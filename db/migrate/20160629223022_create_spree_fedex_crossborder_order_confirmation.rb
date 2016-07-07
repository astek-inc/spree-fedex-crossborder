class CreateSpreeFedexCrossborderOrderConfirmation < ActiveRecord::Migration
  def change
    create_table :spree_fedex_crossborder_order_confirmations do |t|
      t.integer :order_id
      t.string :order_number
      t.string :status, :limit => 1
      t.text :data
      t.timestamps null: false
    end

    add_index :spree_fedex_crossborder_order_confirmations, :order_id
    add_foreign_key :spree_fedex_crossborder_order_confirmations, :spree_orders, column: :order_id
    add_index :spree_fedex_crossborder_order_confirmations, :order_number, name: 'idx_order_number'
  end
end
