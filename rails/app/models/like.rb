class Like < ActiveRecord::Base
  attr_accessible :person, :likable
  belongs_to :likable, polymorphic: true
  belongs_to :person
end
