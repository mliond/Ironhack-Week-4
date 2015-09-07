class Project < ActiveRecord::Base
  def self.last_ten_updated
    all.limit(10).order(updated_at: :desc)
  end
end
