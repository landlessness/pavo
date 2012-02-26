class Tag < ActiveRecord::Base
  # attr_accessible :exhibit, :product, :caption, :products_attributes
  belongs_to :exhibit
  belongs_to :product
  accepts_nested_attributes_for :product
  has_many :comments, as: :commentable
end