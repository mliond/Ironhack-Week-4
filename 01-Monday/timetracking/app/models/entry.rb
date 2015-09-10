class Entry < ActiveRecord::Base
  belongs_to :project
  # if you want different name for user: 
  # belongs_to :worker, class_name: "User", foreign_key: "user_id"
  # but here, we follow convention instead 
  belongs_to :user 
end
