class CreateLineItems < ActiveRecord::Migration[5.1]
  def change
    create_table :line_items do |t|
      t.integer :quantity, default: 1
      t.numeric :price, default: 0

      t.timestamps
    end
  end
end
