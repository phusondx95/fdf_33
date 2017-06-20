class CreateProducts < ActiveRecord::Migration[5.1]
	def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.string :image_url
      t.numeric :price
      t.references :category, foreign_key: true
      t.float :rating

      t.timestamps
    end
    add_index :products, [:category_id, :created_at]
  end
end
