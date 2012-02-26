class Tag < ActiveRecord::Base
  attr_accessible :exhibit, :product, :caption
  belongs_to :exhibit
end
