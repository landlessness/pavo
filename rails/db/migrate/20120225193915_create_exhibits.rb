class CreateExhibits < ActiveRecord::Migration
  def self.up
    create_table :exhibits do |t|
      t.string :caption
      t.references :person
      t.timestamps
    end
  end

  def self.down
    drop_table :exhibits
  end
end
