class AuthorsController < ApplicationController
	def author_page

		@author_to_render = Hash.new

		@author_to_render[:full_name] = 'Gladiator'

		quote = Hash.new
		quote[:text] = 'Shadows and dust maximus, shadows and dust'
		quote[:author] = 'Proximo'
		quote[:tags] = ['Inspirational', 'Gladiator']

		quote1 = Hash.new
		quote1[:text] = 'Single Column, Single Column, Diamond'
		quote1[:author] = 'Gladiator'
		quote1[:tags] = ['Inspirational', 'Gladiator']

		@ary_quotes = [quote, quote1]



	end

end