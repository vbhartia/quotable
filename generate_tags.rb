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

Tags_To_Create = [
	"Sports",
	"Politics",
	"Scientists",
	"Business",
	"Religous",
	"Singer",
	"Rapper"
]

Sports_Quotes = [
	"Michael Jordan",
	"Lance Armstrong",
	"Vince Lombardi",
	"Muhammad Ali"
]

Politics_Quotes = [
	"Abraham Lincoln",
	"Dalai Lama",
	"Marcus Aurelius",
	"Winston Churchill",
	"Napoleon Bonaparte",
	"Mahatma Gandhi"
]

Business_Quotes = [
	"Bill Gates",
	"Michael Jordan",
	"Thomas A. Edison",
	"Warren Buffett",
	"Steve Jobs",
	"Walt Disney",
	"Henry Ford"
]

Religous_Quotes = [
	"Dalai Lama",
	"Sai Baba"
]


Tags_To_Create.each do |tag_title|
	t = Tag.new(:tag_title => tag_title, :url_slug => to_slug(tag_title))
	t.save!
end

# Add a spors tag
ts = Tag.where(:tag_title => "Sports").first

Sports_Quotes.each do |sports_categorty|

	q = Quote.where(:author => sports_categorty)
	q.each do |quote|
		quote.tags << ts
	end

end

# Add a Politics tag
tp = Tag.where(:tag_title => "Politics").first

Politics_Quotes.each do |politics_categorty|

	q = Quote.where(:author => politics_categorty)
	q.each do |quote|
		quote.tags << tp
	end

end

# Add a Business tag
tb = Tag.where(:tag_title => "Business").first

Business_Quotes.each do |business_categorty|

	q = Quote.where(:author => business_categorty)
	q.each do |quote|
		quote.tags << tb
	end

end

# Add a Religous tag
tr = Tag.where(:tag_title => "Religous").first

Religous_Quotes.each do |religous_categorty|

	q = Quote.where(:author => religous_categorty)
	q.each do |quote|
		quote.tags << tr
	end

end