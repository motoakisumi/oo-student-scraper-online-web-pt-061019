require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)

    site = Nokogiri::HTML(open(index_url))
    students = {}
    site.css(".student-name").each do |student|
      name = student.text
      students[name] = name
    end
  end

  def self.scrape_profile_page(profile_url)

  end



end
