class Contact < ActiveRecord::Base

  

  def self.sort_contacts
    order(name: :asc).limit(15)
  end


end

