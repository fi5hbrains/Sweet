class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.string :type
      t.text :description
      t.string :material
      t.decimal :old_price, :precision => 8, :scale => 2
      t.decimal :new_price, :precision => 8, :scale => 2
      t.string :article

      t.timestamps
    end
  end

  def self.down
    drop_table :products
  end
end
