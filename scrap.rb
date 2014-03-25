require 'rubygems'
require 'nokogiri'
require 'open-uri'

# Takes in a nokogiri page returns a string of quotes and authors

Domain = 'http://www.brainyquote.com/'

def scrape_page_quotes(nokogiri_page)
	output = ''

	nokogiri_page.css('div.boxyPaddingBig').each do |quote|

			
		output << "[\"" + quote.css('span.bqQuoteLink').text + "\", \"" + quote.css('div.bq-aut').text + "\"], \n"
	end

	output
end

def scrape_and_paginate(url)

	output = ''

	author_page_quotes = Nokogiri::HTML(open(Domain + url))

	# check to see if pagination exists

	#puts author_page_quotes.css('div.pagination li.disabled').last.text

	puts "*** Current page url"
	puts url


	puts "*** Check disabled condition"
	puts author_page_quotes.css('div.pagination li.disabled').text == ''

	#Check if disabled class exists

	if author_page_quotes.css('div.pagination li.disabled').text != ''

		puts 'Disabled class exists'
		puts author_page_quotes.css('div.pagination li.disabled').first.text

		# Check if disabled class is previous text

		if author_page_quotes.css('div.pagination li.disabled').first.text == "Prev"

			puts 'disabled class is previous'

			puts author_page_quotes.css('div.pagination li.disabled').last.text

			#check if disabled class is next

			if author_page_quotes.css('div.pagination li.disabled').last.text == "Next"

				# both classes are disabled. Scape current page and exit

				output << scrape_page_quotes(author_page_quotes)

			

			else
				puts 'Previous is disabled, next is not, get next url and scrape current page'

				output << scrape_page_quotes(author_page_quotes)

				puts next_url = author_page_quotes.css('div.pagination li a').last['href']

				output << scrape_and_paginate(next_url)

			end
		else
			output << scrape_page_quotes(author_page_quotes) 

		end

	else 
		#Nothing is disabled

		#Make sure pagination exists

		#if not disabled scrape and next page.

		if author_page_quotes.css('div.pagination').text ==''

			#pagination does not exist

			output << scrape_page_quotes(author_page_quotes)

		else
			output << scrape_page_quotes(author_page_quotes)


			puts next_url = author_page_quotes.css('div.pagination li a').last['href']

			output << scrape_and_paginate(next_url)

		end

	end

	output
end

write_to_file = ''

# Get all author pages from the homepage
letter_page_urls = Array.new

homepage = Nokogiri::HTML(open(Domain))

homepage.css('span.body.bq-tn-letters a').map { |link| letter_page_urls << link['href'] }

puts letter_page_urls[0..10]

# Iterate through letter of author page
letter_page_urls.each do |letter_page|

	# All authors from a particular letter
	all_authors_page = Nokogiri::HTML(open(Domain + letter_page))

	# URLs to Index
	uRLs_to_index = Array.new

	all_authors_page.css('table#letterPopular a').map { |link| puts uRLs_to_index << link['href'] }


	uRLs_to_index.each do |author_page_url|
		
		# Particular quote page

		write_to_file << scrape_and_paginate(author_page_url)

	end

end

puts write_to_file

File.open('abc.txt', 'w') { |file| file.write(write_to_file) }
