class AddProcessedToOrder < ActiveRecord::Migration
  def self.up
    add_column :orders, :processed, :boolean, :default => false
  end

  def self.down
    remove_column :orders, :processed
  end
end
