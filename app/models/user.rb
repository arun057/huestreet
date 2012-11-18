class User < ActiveRecord::Base
  attr_accessible :email, :name, :user_name
  has_many :authorizations
  has_many :assets
  has_many :collections
end
