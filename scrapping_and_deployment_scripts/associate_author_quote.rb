count = 0

Quote.all.each do |quote|

	count = count + 1

	puts count

	author_from_quote_slug = quote.author

	author_to_associate = Author.where(:friendly_name => quote.author).first

	if author_to_associate != nil

		#author_to_associate.friendly_name = quote.author

		#author_to_associate.save!

		quote.authors << author_to_associate
	end

end