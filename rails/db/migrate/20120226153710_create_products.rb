class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.references :brand
      t.references :category
      t.references :person
      t.string :name
      t.text :description
      t.string :source
      t.string :materials
      t.string :photo_file_name
      t.string :photo_content_type
      t.string :photo_file_size
      t.string :photo_updated_at
      t.timestamps
    end
  end

  def self.down
    drop_table :products
  end
end
