class QuotesController < ApplicationController

	def quote_page
		@slug = params[:quote_slug]

		quote = Hash.new
		quote[:text] = 'Shadows and dust maximus, shadows and dust'
		quote[:author] = 'Proximo'
		quote[:tags] = ['Inspirational', 'Gladiator']


		@quote_to_render = quote

	end

end