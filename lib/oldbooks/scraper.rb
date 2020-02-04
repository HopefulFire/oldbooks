require 'nokogiri'

class Oldbooks::Scraper

	def initialize(url)
		@url = url
	end

	def scrape_author_and_books
		doc = Nokogiri::HTML(open(@url))

		name = doc.css('h2').text

		bio = doc.css('#biog').text

		gender = bio.split('Nationality: ')[0].gsub('Gender : ', '').strip
		nationality = bio.split('Born : ')[0].split('Nationality: ')[1]
		born = bio.split('Lived :  ')[0].split('Born : ')[1].split(' ')[0]
		died = bio.split('aged : ')[0].split('Died : ')[1].split(' ')[0]
		age = bio.split('aged : ')[1].split("\n")[0]

		author = Oldbooks::Author.create(name: name, gender: gender,
			nationality: nationality, born: born, died: died, age: age)

		booktable = doc.css('#booktable')

		booktable.css('tr').each_with_index do |tr, index|
			if index > 0
				book_list = tr.css('td').map do |td|
					td.text
				end

				title = book_list[0]
				info = book_list[1]
				date = book_list[2]
				url = book_list[3]

				book = Oldbooks::Book.create(title: title, info: info,
					date: date, url: url)
				author.add_book(book)
			end
		end
	end
	
end