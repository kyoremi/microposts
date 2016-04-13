class User < ActiveRecord::Base
  before_save { self.email = self.email.downcase }
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  
  validates :area, length: { maximum: 20 }
  #validates :url, format: { with: /\A[a-z0-9]+\z/i }, length: { maximum: 50 } 
  validates :self_introduction, presence: true, length: { maximum: 200 }
  has_secure_password
  has_many :microposts
end
