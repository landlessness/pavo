class Brand < ActiveRecord::Base
  attr_accessible :name, :photo
  has_many :products
  has_attached_file :photo,
                    styles: {small: '150x150>', thumb: '50x50>'}
end
