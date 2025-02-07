class User < ApplicationRecord
  validates :username,
    presence: true, 
    uniqueness: { case_sensitive: false }, 
    length: {minimum: 3, maximum: 25}

  validates :email,
    presence: true, 
    uniqueness: { case_sensitive: false }, 
    email: true

  has_secure_password

end
