class User < ActiveRecord::Base
has_secure_password 
validates :password, :confirmation => true
validates :email, uniqueness: true

  has_many :abdominals
  has_many :backs
  has_many :biceps
  has_many :chests
  has_many :legs
  has_many :shoulders
  has_many :triceps
  
end
