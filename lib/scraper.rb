require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    student_site = Nokogiri::HTML(open(index_url))
    students = []

    student_site.css("div.student-card").each do |student|
      name = student.css("a div h4.student-name").text
      location = student.css("a div p.student-location").text
      url =student.css("a").attribute("href").value
      info = {:location => location, :name => name,
      profile_url => url}
      students << info
    end
    students
  end

  def self.scrape_profile_page(profile_url)

  end



end
