class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :title
      t.string :description
      t.decimal :unit_price, precision: 12, scale: 2
      t.string :string
      t.string :color
      t.string :material
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
