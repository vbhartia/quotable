class VotesController < ApplicationController

	def add_vote

		quote_to_add_vote = Quote.find(params[:quote_id])

		v = quote_to_add_vote.votes.new	

		v.user = User.first

		v.save!

		redirect_to quote_individual_path(quote_to_add_vote.url_slug)



	end

end