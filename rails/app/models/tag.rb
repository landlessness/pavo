class Tag < ActiveRecord::Base
  after_create Rewarder.new
  # attr_accessible :exhibit, :product, :caption, :products_attributes
  belongs_to :exhibit
  belongs_to :product
  accepts_nested_attributes_for :product
  has_many :comments, as: :commentable
  has_many :likes, as: :likable
  has_one :reward, as: :rewardable
end
