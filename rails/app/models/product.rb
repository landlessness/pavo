class Product < ActiveRecord::Base
  # attr_accessible :brand, :category, :name, :color, :style, :description
  has_many :tags
  has_many :exhibits, through: :tags
end
