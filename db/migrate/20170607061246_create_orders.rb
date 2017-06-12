class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.string :name
      t.string :address
      t.integer :pay_type
      t.references :user, foreign_key: true
      t.integer :status, default: 0

      t.timestamps
    end
    add_index :orders, [:user_id, :created_at]
  end
end
