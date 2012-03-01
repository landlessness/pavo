class Exhibit < ActiveRecord::Base
  after_create Rewarder.new
  # attr_accessible :caption, :person, :photo, :tags, :products, :tags_attributes, :comments_attributes, :products_attributes
  has_many :tags
  has_many :products, through: :tags
  accepts_nested_attributes_for :tags, allow_destroy: true
  accepts_nested_attributes_for :products
  belongs_to :person
  has_many :comments, as: :commentable
  has_many :likes, as: :likable
  has_one :reward, as: :rewardable
  has_attached_file :photo,
                    styles: {small: '150x150>', thumb: '50x50>'}

  scope :mine, lambda { |me| where(person_id: me).order('created_at desc')}
  scope :followees, lambda { |follower| joins(person: :follower_relationships).where(relationships: {follower_id: follower}).order('created_at desc')}

  # default_scoped issue
  # scope :mine_and_followees, lambda { |me| where(person_id: me).order('created_at desc').union(joins(person: :follower_relationships).where(relationships: {follower_id: me}).order('created_at desc'))}
  # scope :mine_and_followees, lambda {|me| find_by_sql(%(SELECT \"t\".* FROM (SELECT \"exhibits\".* FROM \"exhibits\" WHERE \"exhibits\".\"person_id\" = #{me.id} UNION SELECT \"exhibits\".* FROM \"exhibits\" INNER JOIN \"people\" ON \"people\".\"id\" = \"exhibits\".\"person_id\" INNER JOIN \"relationships\" ON \"relationships\".\"followee_id\" = \"people\".\"id\" WHERE \"relationships\".\"follower_id\" = #{me.id}) t ORDER BY \"t\".\"created_at\" DESC))}
  
end
