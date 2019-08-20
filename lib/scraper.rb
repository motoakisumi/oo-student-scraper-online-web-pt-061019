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
    html = open(profile_url)
    doc = Nokogiri::HTML(html)
    return_hash = {}

      social = doc.css(".vitals-container .social-icon-container a")
      social.each do |element| #iterate through each of the social elements and assign the keys if the item exists
        if element.attr('href').include?("twitter")
          return_hash[:twitter] = element.attr('href')
        elsif element.attr('href').include?("linkedin")
          return_hash[:linkedin] = element.attr('href')
        elsif element.attr('href').include?("github")
          return_hash[:github] = element.attr('href')
        elsif element.attr('href').end_with?("com/")
          return_hash[:blog] = element.attr('href')
        end
      end
      return_hash[:profile_quote] = doc.css(".vitals-container .vitals-text-container .profile-quote").text
      return_hash[:bio] = doc.css(".bio-block.details-block .bio-content.content-holder .description-holder p").text

  return_hash
  end
end
