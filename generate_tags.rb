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
	"Rapper",
	"Comedian",
	"Actor"
]

tags = Hash.new { |h, k| h[k] = Array.new }

tags[:Sports] = Array.new

tags[:Sports] = [
	"Michael Jordan",
	"Lance Armstrong",
	"Vince Lombardi",
	"Muhammad Ali",
	"LeBron James",
	"Yogi Berra"
]

tags[:Politics] = Array.new

tags[:Politics] = [
	"Abraham Lincoln",
	"Dalai Lama",
	"Marcus Aurelius",
	"Winston Churchill",
	"Napoleon Bonaparte",
	"Mahatma Gandhi",
	"Indira Gandhi",
	"Robert Kennedy",
	"Rose Kennedy",
	"Nelson Mandela",
	"George S. Patton"
]

tags[:Business] = Array.new

tags[:Business] = [
	"Bill Gates",
	"Michael Jordan",
	"Thomas A. Edison",
	"Warren Buffett",
	"Steve Jobs",
	"Walt Disney",
	"Henry Ford",
	"Karl Marx",
]

tags[:Religous] = Array.new

tags[:Religous] = [
	"Dalai Lama",
	"Sai Baba",
	"Billy Graham",
	"Pope John XXIII", 
]

tags[:Scientists] = Array.new

tags[:Scientists] = [
	"Stephen Hawking",
	"Carl Sagan", 
]


tags[:Singer] = Array.new

tags[:Singer] = [
	"Michael Jackson", 
]

tags[:Presidents] = Array.new

tags[:Presidents] = [
	"Lyndon B. Johnson",
	"John F. Kennedy",
	"Abraham Lincoln",
	"Nelson Mandela",
	"Richard M. Nixon",
	"Barack Obama",
	"Ronald Reagan",
	"Franklin D. Roosevelt",
	"Theodore Roosevelt",
	"Margaret Thatcher"
]


tags[:Actors] = Array.new

tags[:Actors] = [
	"Chuck Norris",
	"Will Smith",
	"Charlie Sheen"
]


tags[:Comedian] = Array.new

tags[:Comedian] = [
	"Conan O'Brien"
]



tags.keys.each do |key|

	puts tag_category = tags[key]

	#Generate Tag 

	t = Tag.new(:tag_title => key.to_s, :url_slug => to_slug(key.to_s))

	tags[key].each do |author|

		q = Quote.where(:author => author)
		q.each do |quote|
			quote.tags << t
		end
	end
end
