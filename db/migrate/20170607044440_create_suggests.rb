class CreateSuggests < ActiveRecord::Migration[5.1]
  def change
    create_table :suggests do |t|
      t.string :title
      t.text :description
      t.string :image
      t.numeric :price
      t.references :user, foreign_key: true
      t.string :suggest_url
      t.boolean :status

      t.timestamps
    end
    add_index :suggests, [:user_id, :created_at]
  end
end
