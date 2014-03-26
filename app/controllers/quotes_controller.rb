class QuotesController < ApplicationController

	def quote_page

		@quote_to_render = Quote.where(:url_slug => params[:quote_slug]).first
		puts @quote_to_render.quote_text

	end

	def discover_page

		@authors = Array.new

		Quote.all.each do |quote|
			@authors << quote.author
		end

		@authors = @authors.uniq

		@tags = Tag.all

	end

end