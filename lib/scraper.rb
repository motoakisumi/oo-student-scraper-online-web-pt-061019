require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    index_site = Nokogiri::HTML(open(index_url))
    students = []

    index_site.css("div.student-card a").each do |student|

      location = student.css("div p.student-location").text
      name = student.css("div h4.student-name").text
      url =student.attribute("href").value
      info = {:location => location, :name => name, :profile_url => url}
      students << info
    end
    students
  end

  def self.scrape_profile_page(profile_url)
    profile_site = Nokogiri::HTML(open(profile_url))

    collection = []
    info = {}
    profile_site.css("div.social-icon-container a").each do |profile|
      profile.each do |social|
        if social.attribute("href").include?("twitter")
          info{:twitter => social.attribute("href").value}
        elsif social.attribute("href").include?("linkedin")
          info{:linkedin => social.attribute("href").value}
        elsif social.attribute("href").include?("github")
          info{:github => social.attribute("href").value}
        else
          info{:blog => social.attribute("href").value}
        end
      end
    info{:profile_quote => profile_site.css("div.vitals-text-container div.profile-quote").text}


  end

end
