require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    student_site = Nokogiri::HTML(open(index_url))
    students = []

    profile = student_site.css("div.student-card")

    profile.each do |student|
      name = student.css("h4.student-name").text
      location = student.css("p.student-location").text
      info = {:name => name, :location => location}
      students << info
    end
    students
  end

  def self.scrape_profile_page(profile_url)

  end



end
