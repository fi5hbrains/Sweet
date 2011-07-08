class AddTypeIdToProduct < ActiveRecord::Migration
  def self.up
    add_column :products, :type_id, :integer
  end

  def self.down
    remove_column :products, :type_id
  end
end
