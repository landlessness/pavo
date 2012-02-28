class Person < ActiveRecord::Base
  has_many :exhibits
  has_many :products, through: :exhibits
  has_many :comments
  has_many :follower_relationships, foreign_key: 'followee_id', class_name: 'Relationship'
  has_many :followers, class_name: 'Person', through: :follower_relationships
  has_many :followee_relationships, foreign_key: 'follower_id', class_name: 'Relationship'
  has_many :followees, class_name: 'Person', through: :followee_relationships
  
  has_attached_file :photo,
                    styles: {small: '150x150>', thumb: '50x50>'}
  # new columns need to be added here to be writable through mass assignment
  attr_accessible :username, :email, :password, :password_confirmation, :photo

  attr_accessor :password
  before_save :prepare_password

  validates_presence_of :username
  validates_uniqueness_of :username, :email, :allow_blank => true
  validates_format_of :username, :with => /^[-\w\._@]+$/i, :allow_blank => true, :message => "should only contain letters, numbers, or .-_@"
  validates_format_of :email, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i
  validates_presence_of :password, :on => :create
  validates_confirmation_of :password
  validates_length_of :password, :minimum => 4, :allow_blank => true

  # login can be either username or email address
  def self.authenticate(login, pass)
    person = find_by_username(login) || find_by_email(login)
    return person if person && person.password_hash == person.encrypt_password(pass)
  end

  def encrypt_password(pass)
    BCrypt::Engine.hash_secret(pass, password_salt)
  end

  def follows?(person)
    self.followees.exists?(person)
  end

  def follower_relationship_to(followee)
    return self.follower_relationships.first
    # Relationship.first
  end

  private

  def prepare_password
    unless password.blank?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = encrypt_password(password)
    end
  end
end
