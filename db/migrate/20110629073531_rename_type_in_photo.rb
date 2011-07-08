class RenameTypeInPhoto < ActiveRecord::Migration
  def self.up
    remove_column :photos, :type
    add_column :photos, :view, :string
  end

  def self.down
    add_column :photos, :type, :string
    remove_column :photos, :view
  end
end
