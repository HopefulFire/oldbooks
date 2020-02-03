require 'nokogiri'

class Oldbooks::Scraper

	def initialize(url)
		@url = url
	end

	def scrape_author_and_books
		doc = Nokogiri::HTML(open(@url))
		name = doc.css('h2').text
		puts bio = doc.css('#biog').text
		puts gender = bio.split('Nationality: ')[0].gsub('Gender : ', '').strip
		puts nationality = bio.split('Born : ')[0].split('Nationality: ')[1]
		puts born = bio.split('Lived :  ')[0].split('Born : ')[1].split(' ')[0] #not splitting on space!
	end

end