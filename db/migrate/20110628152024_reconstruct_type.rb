class ReconstructType < ActiveRecord::Migration
  def self.up
    remove_column :types, :type
    add_column :types, :section, :string
  end

  def self.down
    add_column :types, :type, :string
    remove_column :types, :section
  end
end
