class Contact < ActiveRecord::Base

  validates :name, presence: true
  validates :address, presence: true
  validates :phone, format: {with: /[\d]/, message: "only allows numbers" }
  validates :email, format: {with: /\b[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\b/, message: "please enter valid email address"}

  def self.create_ten_sorted_contacts
    all.order(name: :asc).limit(10)
  end

end
