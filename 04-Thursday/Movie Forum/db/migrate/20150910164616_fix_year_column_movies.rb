class FixYearColumnMovies < ActiveRecord::Migration
  def change
    rename_column :movies, :string, :year
  end
end
