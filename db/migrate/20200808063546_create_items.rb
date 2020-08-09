class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :comment, null: false
      t.integer :price, null: false
      t.integer :category_id, null: false
      t.integer :status_id, null: false
      t.integer :burden_id, null: false
      t.integer :ship_origin_id, null: false
      t.integer :ship_day_id, null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
