class AddSizeToLineItem < ActiveRecord::Migration
  def self.up
    add_column :line_items, :size36, :integer, :default => 0
    add_column :line_items, :size38, :integer, :default => 0
    add_column :line_items, :size40, :integer, :default => 0
    add_column :line_items, :size42, :integer, :default => 0
    add_column :line_items, :size44, :integer, :default => 0
    add_column :line_items, :size46, :integer, :default => 0
    add_column :line_items, :size48, :integer, :default => 0
    add_column :line_items, :size50, :integer, :default => 0
    add_column :line_items, :size52, :integer, :default => 0
  end

  def self.down
    remove_column :line_items36, :size
    remove_column :line_items38, :size
    remove_column :line_items40, :size
    remove_column :line_items42, :size
    remove_column :line_items44, :size
    remove_column :line_items46, :size
    remove_column :line_items48, :size
    remove_column :line_items50, :size
    remove_column :line_items52, :size
  end
end
