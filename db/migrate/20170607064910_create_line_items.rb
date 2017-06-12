class CreateLineItems < ActiveRecord::Migration[5.1]
  def change
    create_table :line_items do |t|
      t.integer :quantity
      t.numeric :price

      t.timestamps
    end
  end
end
