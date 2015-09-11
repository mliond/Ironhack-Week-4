class CreateConcerts < ActiveRecord::Migration
  def change
    create_table :concerts do |t|
      t.string :band
      t.string :venue
      t.string :city
      t.datetime :date
      t.string :description
      t.timestamps
    end
  end
end
