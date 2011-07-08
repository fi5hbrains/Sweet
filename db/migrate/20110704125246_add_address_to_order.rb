class AddAddressToOrder < ActiveRecord::Migration
  def self.up
    add_column :orders, :address, :text
    add_column :orders, :metro, :stirng
  end

  def self.down
    remove_column :orders, :metro
    remove_column :orders, :address
  end
end
