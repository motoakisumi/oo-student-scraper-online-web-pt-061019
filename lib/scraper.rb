require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    student_site = Nokogiri::HTML(open(index_url))
    students = []

    student_site.css("div.student-card a").each do |student|

      location = student.css("div p.student-location").text
      name = student.css("div h4.student-name").text

      info = {:location => location, :name => name}
      students << info
    end
    students
  end

  def self.scrape_profile_page(profile_url)
    student_site = Nokogiri::HTML(open(index_url))
    students = []

    url =student.css("a").attribute("href").value
    info = {:profile_url => url}
    students << info
  end



end
