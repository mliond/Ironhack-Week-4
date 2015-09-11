class Book < ActiveRecord::Base

  has_many :reviews
  
  def self.search(search)
    Book.find_by('name LIKE ?', "%#{search}%")
  end
  
end
