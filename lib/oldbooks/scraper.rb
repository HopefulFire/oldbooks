class Oldbooks::Scraper

	HOME_URL = 'https://www.worldofbooks.com/'

	def initialize(url)
		@url = url
	end

	def scrape_booklist
		doc = Nokogiri::HTML(open(@url))
		doc_books = doc.css('.gridItem')
		doc_books.each do |doc_book|
			book_url = HOME_URL + doc_book.css('a:first').attr('href')
		end
	end
end