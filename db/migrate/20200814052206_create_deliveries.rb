class CreateDeliveries < ActiveRecord::Migration[6.0]
  def change
    create_table :deliveries do |t|
      t.string :postal_code, null: false
      t.string :city, null: false
      t.string :block_num, null: false
      t.string :building
      t.string :phone, null: false
      t.integer :prefecture_id, null: false
      t.references :item, null: false, foreign_key: true
      t.timestamps
    end
  end
end

