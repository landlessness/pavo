class Reward < ActiveRecord::Base
  attr_accessible :rewardable, :person, :points
  belongs_to :rewardable, polymorphic: true
  belongs_to :person
  before_create :calculate
  private
  def calculate
    self.points = 1
    case self.rewardable.class.name
    when Exhibit.name
      self.person = self.rewardable.person
      self.description = 'You created a new ' + self.rewardable.class.name
      if !rewardable.caption.blank?
        self.points += 1
        self.description += ' with a caption'
      end
    when Tag.name
      self.person = self.rewardable.exhibit.person
      self.description = 'You tagged a product'
      if !rewardable.caption.blank?
        self.points += 1
        self.description += ' with a caption'
      end
    end
  end
end
