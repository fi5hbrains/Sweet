class RestoreOrder < ActiveRecord::Migration
  def self.up
    create_table :orders do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.text :address
      t.boolean :processed, :default => false
      t.timestamps
    end
  end

  def self.down
    drop_table :orders
  end
end
