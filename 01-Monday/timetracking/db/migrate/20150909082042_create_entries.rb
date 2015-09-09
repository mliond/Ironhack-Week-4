class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.integer :hours
      t.integer :minutes
      t.references :project, index: true 
      t.text :comment
      t.datetime :start_date
      t.timestamps
    end
  end
end
