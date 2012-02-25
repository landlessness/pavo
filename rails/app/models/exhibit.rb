class Exhibit < ActiveRecord::Base
  attr_accessible :caption, :person
  belongs_to :person
end
