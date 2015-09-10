class User < ActiveRecord::Base
  # alternatively: 
  # has_many :posts, class_name: 'Entry', foreign_key: 'user_id'
  has_many :entries
end
