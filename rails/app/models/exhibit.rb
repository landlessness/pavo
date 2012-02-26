class Exhibit < ActiveRecord::Base
  attr_accessible :caption, :person, :photo, :tags_attributes
  belongs_to :person
  has_many :tags
  accepts_nested_attributes_for :tags, allow_destroy: true
  has_attached_file :photo,
                    styles: {small: '150x150>'}
end
