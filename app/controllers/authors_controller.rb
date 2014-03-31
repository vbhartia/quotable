class AuthorsController < ApplicationController
	def author_page

		@author = Author.where(:slug => params[:author_slug]).first

		@quotes_author_to_render = @author.quotes

		@author_to_render = @author.friendly_name

	end

	def all_authors

		@authors = Author.all

	end

end