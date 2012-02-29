class Exhibit < ActiveRecord::Base
  # attr_accessible :caption, :person, :photo, :tags, :products, :tags_attributes, :comments_attributes, :products_attributes
  has_many :tags
  has_many :products, through: :tags
  accepts_nested_attributes_for :tags, allow_destroy: true
  accepts_nested_attributes_for :products
  belongs_to :person
  has_many :comments, as: :commentable
  has_attached_file :photo,
                    styles: {small: '150x150>', thumb: '50x50>'}

  # Exhibit.
  scope :followees, lambda { |follower| joins(person: :follower_relationships).where(relationships: {follower_id: follower})}
end
