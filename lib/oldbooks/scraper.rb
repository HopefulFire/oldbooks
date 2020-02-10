class Oldbooks::Scraper

	HOME_URL = 'https://www.worldofbooks.com'

	def initialize(url = '')
		@url = HOME_URL + url
	end

	def scrape_booklist
		doc = Nokogiri::HTML(open(@url))
		doc_books = doc.css('.gridItem')
		doc_books.each do |doc_book|
			url = HOME_URL + doc_book.css('a:first').attr('href')
			book = Oldbooks::Book.create(url: url)
		end
	end

	def scrape_book(book)
		doc = Nokogiri::HTML(open(book.url))

		book.price = doc.css('span.price').text

		information = doc.css('.attribute div')
		information.each_with_index do |info, index|
			case index
			when 1
				book.title = info.text
			when 2
				book.author = info.text
			when 3
				book.condition = info.text
			when 5
				book.publisher = info.text
			end
		end
		book
	end

end