class Movie < ActiveRecord::Base

  def self.search_db(keyword)
    db_result = Movie.find_by(title: keyword)
  end

end
