class Product < ActiveRecord::Base
  attr_accessible :brand_id, :category, :name, :color, :style, :description, :source, :materials
  belongs_to :brand
  has_many :tags
  has_many :exhibits, through: :tags
  has_attached_file :photo,
                    styles: {small: '150x150>', thumb: '50x50>'}
end
