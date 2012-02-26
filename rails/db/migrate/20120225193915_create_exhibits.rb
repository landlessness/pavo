class CreateExhibits < ActiveRecord::Migration
  def self.up
    create_table :exhibits do |t|
      t.string :caption
      t.string :photo_file_name
      t.string :photo_content_type
      t.string :photo_file_size
      t.string :photo_updated_at
      t.references :person
      t.timestamps
    end
  end

  def self.down
    drop_table :exhibits
  end
end
