class AddSizeToProduct < ActiveRecord::Migration
  def self.up
    add_column :products, :size36, :integer, :default => 0
    add_column :products, :size38, :integer, :default => 0
    add_column :products, :size40, :integer, :default => 0
    add_column :products, :size42, :integer, :default => 0
    add_column :products, :size44, :integer, :default => 0
    add_column :products, :size46, :integer, :default => 0
    add_column :products, :size48, :integer, :default => 0
    add_column :products, :size50, :integer, :default => 0
    add_column :products, :size52, :integer, :default => 0
  end

  def self.down
    remove_column :products, :size52
    remove_column :products, :size50
    remove_column :products, :size48
    remove_column :products, :size46
    remove_column :products, :size44
    remove_column :products, :size42
    remove_column :products, :size40
    remove_column :products, :size38
    remove_column :products, :size36
  end
end
