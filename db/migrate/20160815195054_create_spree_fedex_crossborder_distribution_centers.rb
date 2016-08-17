class CreateSpreeFedexCrossborderDistributionCenters < ActiveRecord::Migration
  def change
    create_table :spree_fedex_crossborder_distribution_centers do |t|
      t.string :name
      t.string :address1
      t.string :address2
      t.string :city
      t.integer :state_id
      t.string :zipcode
      t.integer :country_id
      t.integer :zone_id
    end

    add_timestamps(:spree_fedex_crossborder_distribution_centers, null: false)
    add_column :spree_fedex_crossborder_distribution_centers, :deleted_at, :timestamp
    add_index :spree_fedex_crossborder_distribution_centers, :deleted_at, name: 'distribution_centers_deleted_at'
    add_foreign_key :spree_fedex_crossborder_distribution_centers, :spree_states, column: :state_id, primary_key: :id
    add_foreign_key :spree_fedex_crossborder_distribution_centers, :spree_countries, column: :country_id, primary_key: :id
    add_foreign_key :spree_fedex_crossborder_distribution_centers, :spree_zones, column: :zone_id, primary_key: :id
  end
end
