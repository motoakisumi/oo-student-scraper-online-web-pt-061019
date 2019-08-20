require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    html = File.read('./fixtures/student-site/index.html')

    student_site = Nokogiri::HTML(html)
    projects = {}
  binding.pry

  end

  def self.scrape_profile_page(profile_url)

  end



end
