class AuthorsController < ApplicationController
	def author_page

		@quotes_author_to_render = Quote.where(:author => params[:author_slug])

		@author_to_render = 'Michael Jordan'

	end

end