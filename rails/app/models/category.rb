class Category < ActiveRecord::Base
  attr_accessible :name, :category_id
  belongs_to :parent, class_name: 'Category', foreign_key: 'category_id'
  has_many :children, :class_name => 'Category'
  has_many :products
  belongs_to :category
  has_attached_file :photo,
                    styles: {small: '150x150>', thumb: '50x50>'}
end
