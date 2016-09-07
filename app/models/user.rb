class User < ApplicationRecord

before_save { self.email = email.downcase }
validates :name, presence: true, length: { maximum: 50 }

VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

validates :email, presence: true, length: { maximum: 255}, 
				format: { with: VALID_EMAIL_REGEX },
				uniqueness:{ case_sensitive: false } #helper in Rails, not something we specifically created

has_secure_password
validates :password, presence: true, length: { minimum: 6 }
end
