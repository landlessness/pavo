class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.references :brand
      t.references :category
      t.references :person
      t.string :name
      t.text :description
      t.timestamps
    end
  end

  def self.down
    drop_table :products
  end
end
