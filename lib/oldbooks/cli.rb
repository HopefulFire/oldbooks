class Oldbooks::CLI

	URLS =
	{
		fiction_books: '/en-us/category/fiction-books',
		non_fiction_books: '/en-us/category/non-fiction-books',
		childrens_books: '/en-us/category/childrens-books',
		rare_books: '/en-us/category/rare-books'
	}

	def run
		scraper = Oldbooks::Scraper.new(choose_url)
		scraper.scrape_booklist
		list_books
		choose_book
	end

	def choose_book
		loop do
			puts
			puts 'Choose a book by number or type exit'
			input = gets.strip
			break if input == 'exit'
			index = input.to_i - 1
			if index != -1
				describe_book(index)
			end
		end
		puts 'Goodbye!'
	end

	def describe_book(index)
		book = Oldbooks::Book::ALL[index]
		if book
			puts
			puts "#{book.title}:"
			puts "It was authored by #{book.author},"
			puts "was published by #{book.publisher},"
			puts "and is in #{book.condition} condition."
			puts "It is going for #{book.price}."
			puts "Find it at #{book.url}"
		else
			puts 'Invalid number, try again'
		end
	end

	def list_books
		Oldbooks::Book::ALL.each.with_index(1) do |book, index|
			puts "#{index}. #{book.title}"
			puts
		end
	end

	def choose_url
		puts
		puts 'Enter 1 for fiction, 2 for non-fiction, 3 for childrens, and 4 for rare books:'
		
		case gets.strip
		when '1'
			URLS[:fiction_books]
		when '2'
			URLS[:non_fiction_books]
		when '3'
			URLS[:childrens_books]
		when '4'
			URLS[:rare_books]
		else
			choose_url
		end
	end
end