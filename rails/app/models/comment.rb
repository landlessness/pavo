class Comment < ActiveRecord::Base
  attr_accessible :commentable, :body
  belongs_to :commentable, polymorphic: true
  belongs_to :person
end
