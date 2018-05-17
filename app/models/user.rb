class User < ActiveRecord::Base
  has_many :abdominals
  has_many :backs
  has_many :biceps
  has_many :chests
  has_many :legs
  has_many :shoulders
  has_many :triceps
  
  has_secure_password 
end
