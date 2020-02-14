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
		loop do
			puts
			puts Rainbow('Choose a book by number or type exit:').green
			input = gets.strip
			break if input == 'exit'
			choose_book(input)
		end
		puts 'Goodbye!'
	end

	def choose_book(input)
		index = input.to_i - 1
		book = Oldbooks::Book::ALL[index]
		if book && index >= 0
			describe_book(book)
		else
			puts Rainbow('Invalid number, try again').bright.red
		end
	end

	def describe_book(book)
		puts
		puts Rainbow("#{book.title}:").aqua
		puts "It was authored by #{book.author},"
		puts "was published by #{book.publisher},"
		puts "and is in #{book.condition} condition."
		puts "It is going for #{book.price}."
		puts "Find it at #{book.url}"
	end

	def list_books
		Oldbooks::Book::ALL.each.with_index(1) do |book, index|
			puts
			puts Rainbow("#{index}. #{book.title}").aqua
		end
	end

	def choose_url
		puts
		puts Rainbow('Enter 1 for fiction, 2 for non-fiction, 3 for childrens, and 4 for rare books:').green
		
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