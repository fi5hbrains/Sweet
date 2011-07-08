class RemoveQuantityFromLineItem < ActiveRecord::Migration
  def self.up
    remove_column :line_items, :quantity
  end

  def self.down
    add_column :line_items, :quantity, :integer, :default => 1
  end
end
