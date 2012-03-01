class CreateRewards < ActiveRecord::Migration
  def self.up
    create_table :rewards do |t|
      t.references :rewardable, polymorphic: true
      t.references :person
      t.integer :points
      t.string :description
      t.timestamps
    end
  end

  def self.down
    drop_table :rewards
  end
end
