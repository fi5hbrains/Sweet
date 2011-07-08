class DropOrder < ActiveRecord::Migration
  def self.up
    drop_table :orders
  end

  def self.down
    create_table :orders do |t|
    t.string :name
    t.string :phone
    t.string :email

    t.timestamps
    end
  end
end
