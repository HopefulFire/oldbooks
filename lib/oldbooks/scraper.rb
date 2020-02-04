require 'nokogiri'

class Oldbooks::Scraper

	def initialize(url)
		@url = url
	end

	def scrape_author_and_books
		doc = Nokogiri::HTML(open(@url))
		puts name = doc.css('h2').text
		puts bio = doc.css('#biog').text
		puts gender = bio.split('Nationality: ')[0].gsub('Gender : ', '').strip
		puts nationality = bio.split('Born : ')[0].split('Nationality: ')[1]
		puts born = bio.split('Lived :  ')[0].split('Born : ')[1].split(' ')[0]
		puts died = bio.split('aged : ')[0].split('Died : ')[1].split(' ')[0]
		puts age = bio.split('aged : ')[1].split("\n")[0]
	end

end