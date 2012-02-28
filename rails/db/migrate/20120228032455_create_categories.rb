class CreateCategories < ActiveRecord::Migration
  def self.up
    create_table :categories do |t|
      t.string :name
      t.references :category
      t.string :photo_file_name
      t.string :photo_content_type
      t.string :photo_file_size
      t.string :photo_updated_at
      t.timestamps
    end
  end

  def self.down
    drop_table :categories
  end
end
