class Product < ActiveRecord::Base
  attr_accessible :brand, :category, :name, :color, :style, :description
  belongs_to :brand
  has_many :tags
  has_many :exhibits, through: :tags
  has_attached_file :photo,
                    styles: {small: '150x150>', thumb: '50x50>'}
end
