class TagsController < ApplicationController

	def tag_page

		@tag_to_render = Tag.where(:url_slug => params[:tag]).first

		@quotes_tag_to_render = @tag_to_render.quotes		

	end

	def all_tags

		@all_tags = Tag.all

	end

end