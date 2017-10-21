class User < ActiveRecord::Base
  has_secure_password
  has_many :ideas
  has_many :likes, dependent: :destroy
  has_many :ideas_liked, through: :likes, source: :idea

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i

  before_save :downcase

  validates :name, :alias,  presence: true

  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }


  def downcase
      self.name.downcase!
      self.alias.downcase!
      self.email.downcase!
  end






end
