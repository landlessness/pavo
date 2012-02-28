class CreateRelationships < ActiveRecord::Migration
  def self.up
    create_table :relationships do |t|
      t.references :follower
      t.references :followee
      t.string :status
      t.timestamps
    end
  end

  def self.down
    drop_table :relationships
  end
end
