class Test < ActiveRecord::Base
  def self.iron_find(num)
    where(id: num).first
  end

  def self.last_updated(num)
    limit(num).order(updated_at: :desc)
  end

  def self.clean_old
    time = Time.now - 1.minutes
    where('created_at < ?', time).destroy_all
  end
end
