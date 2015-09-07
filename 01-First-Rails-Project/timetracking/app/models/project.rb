class Project < ActiveRecord::Base
  def self.last_ten_updated
    all.order(updated_at: :desc).limit(10)
  end
end
