class AddVisitstoLinks < ActiveRecord::Migration
  def change
    add_column :links, :visits, :string
  end
end
