class FollowerController < ApplicationController

	def add 
	end

	def index

		@followers = current_user.followers

	end

end