class Project < ActiveRecord::Base
  
  validates :title, 
    presence: true, 
    uniqueness: true, 
    length: {maximum: 5}, 
    format: {with: /[a-zA-Z0-9\s]+/ , message: 'only allows letters'}

  def self.last_ten_updated
    all.order(updated_at: :desc).limit(10)
  end

end
