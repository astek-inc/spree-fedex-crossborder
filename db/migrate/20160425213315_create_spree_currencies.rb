class CreateSpreeCurrencies < ActiveRecord::Migration
  def change
    create_table :spree_currencies do |t|
      t.string :name
      t.string :code
      t.string :symbol
      t.string :symbol_position
    end

    add_timestamps(:spree_currencies, null: false)
    add_column :spree_currencies, :deleted_at, :timestamp
    add_index :spree_currencies, :deleted_at
  end
end
