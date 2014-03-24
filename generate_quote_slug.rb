def to_slug(param=self.slug)

    # strip the string
    ret = param.strip

    #blow away apostrophes
    ret.gsub! /['`]/, ""

    #blow away the periods
    ret.gsub! /[.]/, ""

    # @ --> at, and & --> and
    ret.gsub! /\s*@\s*/, " at "
    ret.gsub! /\s*&\s*/, " and "

    # replace all non alphanumeric, periods with dash
    ret.gsub! /\s*[^A-Za-z0-9\.]\s*/, '-'

    # replace underscore with dash
    ret.gsub! /[-_]{2,}/, '-'

    # convert double dashes to single
    ret.gsub! /-+/, "-"

    # strip off leading/trailing dash
    ret.gsub! /\A[-\.]+|[-\.]+\z/, ""

    ret
end

#generate slug of 50 characters.
#Format 
	# Author + Quote
	# 50 characters

Quote.all.each do |quote|
	author_slug = to_slug(quote.author)
	text_slug = to_slug(quote.quote_text[0..99])

	quote_slug = author_slug + "-" + text_slug

	quote_slug = quote_slug[0..99]

	quote.url_slug = quote_slug

	quote.save!
end