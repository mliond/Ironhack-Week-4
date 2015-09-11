class AddRefToReviews < ActiveRecord::Migration
  def change
    add_reference :reviews, :book, index: true
  end
end
