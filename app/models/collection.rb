class Collection < ActiveRecord::Base
  attr_accessible :name, :user_id
  has_and_belongs_to_many :assets
  belongs_to :user
end
