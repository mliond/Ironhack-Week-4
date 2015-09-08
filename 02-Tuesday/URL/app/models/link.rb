class Link < ActiveRecord::Base

  def self.look_up_url(short_url)
    page = find_by(short_url: short_url)
    number = page.visits.to_i + 1
    page.update(visits: number)
    return page.long_url
  end

  def self.create_random_letters(num)
    num.times.map { [*'A'..'Z', *'a'..'z'].sample }.join
  end

  def self.check_for_http(url)
    unless url.include? "http://"
      url = "http://" + url
    end
    return url
  end

  def self.check_for_duplicates(url)
    if Link.find_by(long_url: url).present? 
      return true
    else 
      return false
    end
  end

  def self.create_new_entry(short_url, long_url)
    Link.create(short_url: short_url, long_url: long_url)
  end

  def self.create_new_entry_sec(url)
    short_url = self.create_random_letters(3)
    long_url = self.check_for_http(url)
    if self.check_for_duplicates(long_url) == false
      Link.create(short_url: short_url, long_url: long_url) 
    end
  end


end
