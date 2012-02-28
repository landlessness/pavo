class Relationship < ActiveRecord::Base
  attr_accessible :follower, :followee, :status
  belongs_to :follower, class_name: 'Person', foreign_key: 'follower_id'
  belongs_to :followee, class_name: 'Person', foreign_key: 'followee_id'
end
