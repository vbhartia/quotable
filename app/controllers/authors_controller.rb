class AuthorsController < ApplicationController
	def author_page

		@quotes_author_to_render = Quote.where(:author => params[:author_slug])

		@author_to_render = 'Michael Jordan'

	end

	def all_authors

		@authors = Array.new

		Quote.all.each do |quote|
			@authors << quote.author
		end

		@authors = @authors.uniq

	end

end