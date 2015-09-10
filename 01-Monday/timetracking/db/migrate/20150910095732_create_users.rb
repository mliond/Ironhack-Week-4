class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, null: false

      t.timestamps
    end

    change_table :entries do |t| # same as add_column, but with that the references dont work
      t.references :user, index: true
    end
  end
end
