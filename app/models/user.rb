class User < ActiveRecord::Base
  attr_accessible :email, :name, :user_name
  has_many :authorizations
end
