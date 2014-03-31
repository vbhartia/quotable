require 'rubygems'
require 'nokogiri'
require 'open-uri'

# Takes in a nokogiri page returns a string of quotes and authors

Domain = 'http://en.wikipedia.org/'

authors_to_capture = ["Ansel Adams", "Douglas Adams", "John Adams", "Joseph Addison", "Sholom Aleichem", "Muhammad Ali", "Woody Allen", "Barbara de Angelis", "Maya Angelou", "Susan B. Anthony", "Thomas Aquinas", "Aristotle", "Lance Armstrong", "Isaac Asimov", "Francis of Assisi", "Saint Augustine", "Marcus Aurelius", "Jane Austen", "Sai Baba", "Richard Bach", "James A. Baldwin", "Lucille Ball", "Honore de Balzac", "John Barrymore", "Henry Ward Beecher", "Yogi Berra", "William Blake", "Erma Bombeck", "Napoleon Bonaparte", "Vanna Bonta", "Ray Bradbury", "H. Jackson Brown, Jr.", "Buddha", "Warren Buffett", "Edmund Burke", "Leo Buscaglia", "Joseph Campbell", "Albert Camus", "George Carlin", "Thomas Carlyle", "Dale Carnegie", "George Washington Carver", "Chanakya", "Coco Chanel", "Charlie Chaplin", "Gilbert K. Chesterton", "Winston Churchill", "Kurt Cobain", "Paulo Coelho", "Confucius", "Calvin Coolidge", "Bill Copeland", "Bill Cosby", "e. e. cummings", "Salvador Dali", "Rodney Dangerfield", "Charles Darwin", "James Dean", "Ellen DeGeneres", "Democritus", "Johnny Depp", "Rene Descartes", "Charles Dickens", "Emily Dickinson", "Marlene Dietrich", "Phyllis Diller", "Walt Disney", "Benjamin Disraeli", "Frederick Douglass", "Peter Drucker", "Wayne Dyer", "Bob Dylan", "Amelia Earhart", "Clint Eastwood", "Meister Eckhart", "Thomas A. Edison", "Albert Einstein", "Dwight D. Eisenhower", "George Eliot", "T. S. Eliot", "Black Elk", "Jim Elliot", "Albert Ellis", "Ralph Waldo Emerson", "Eminem", "Epictetus", "Epicurus", "Desiderius Erasmus", "Euripides", "Dale Evans", "William Feather", "W. C. Fields", "Harvey Fierstein", "F. Scott Fitzgerald", "Malcolm Forbes", "Henry Ford", "E. M. Forster", "Michael J. Fox", "Anatole France", "Brendan Francis", "Anne Frank", "Viktor E. Frankl", "Benjamin Franklin", "Sigmund Freud", "Milton Friedman", "Erich Fromm", "Robert Frost", "Thomas Fuller", "John Kenneth Galbraith", "Galileo Galilei", "Indira Gandhi", "Mahatma Gandhi", "John W. Gardner", "Judy Garland", "Marcus Garvey", "Bill Gates", "Khalil Gibran", "Andre Gide", "William E. Gladstone", "Arnold H. Glasow", "Johann Wolfgang von Goethe", "Vincent Van Gogh", "Billy Graham", "Cary Grant", "Alexander the Great", "Che Guevara", "Walter Hagen", "Stephen Hawking", "Nathaniel Hawthorne", "Helen Hayes", "Mitch Hedberg", "Robert A. Heinlein", "Ernest Hemingway", "Jimi Hendrix", "Matthew Henry", "Patrick Henry", "Audrey Hepburn", "Katharine Hepburn", "Napoleon Hill", "Horace", "Elbert Hubbard", "Victor Hugo", "Hubert H. Humphrey", "Aldous Huxley", "Andrew Jackson", "LaToya Jackson", "Michael Jackson", "LeBron James", "William James", "Thomas Jefferson", "Muhammad Ali Jinnah", "Steve Jobs", "Pope John XXIII", "Lyndon B. Johnson", "Samuel Johnson", "Angelina Jolie", "Janis Joplin", "Michael Jordan", "Chief Joseph", "Joseph Joubert", "James Joyce", "Carl Jung", "Franz Kafka", "A. P. J. Abdul Kalam", "Immanuel Kant", "John Keats", "Helen Keller", "John F. Kennedy", "Robert Kennedy", "Rose Kennedy", "Omar Khayyam", "Victor Kiam", "Soren Kierkegaard", "Martin Luther King, Jr.", "Stephen King", "Rudyard Kipling", "Henry A. Kissinger", "Robert Kiyosaki", "Jiddu Krishnamurti", "Elisabeth Kubler-Ross", "Louis L'Amour", "Dalai Lama", "Fran Lebowitz", "Bruce Lee", "Robert E. Lee", "Vladimir Lenin", "John Lennon", "C. S. Lewis", "Abraham Lincoln", "Anne Morrow Lindbergh", "John Locke", "Vince Lombardi", "Henry Wadsworth Longfellow", "H. P. Lovecraft", "James Russell Lowell", "John Lubbock", "Lucretius", "Martin Luther", "Niccolo Machiavelli", "Malcolm X", "Nelson Mandela", "Og Mandino", "Marilyn Manson", "Bob Marley", "Ralph Marston", "Groucho Marx", "Karl Marx", "Andre Maurois", "John C. Maxwell", "Margaret Mead", "H. L. Mencken", "Thomas Merton", "A. A. Milne", "Marilyn Monroe", "Alfred A. Montapert", "Jim Morrison", "Guru Nanak", "Ogden Nash", "George Jean Nathan", "Jawaharlal Nehru", "Willie Nelson", "Louise Berliawsky Nevelson", "Huey Newton", "Isaac Newton", "Reinhold Niebuhr", "Friedrich Nietzsche", "Earl Nightingale", "Florence Nightingale", "Anais Nin", "Richard M. Nixon", "Chuck Norris", "Henri Nouwen", "Novalis", "Ted Nugent", "Conan O'Brien", "Carroll O'Connor", "Flannery O'Connor", "Georgia O'Keeffe", "Austin O'Malley", "P. J. O'Rourke", "Barack Obama", "Michelle Obama", "David Ogilvy", "Aristotle Onassis", "J. Robert Oppenheimer", "Robert Orben", "Suze Orman", "George Orwell", "William Osler", "Joel Osteen", "Ovid", "Jesse Owens", "Thomas Paine", "Chuck Palahniuk", "Rosa Parks", "Dolly Parton", "Blaise Pascal", "George S. Patton", "Pope John Paul II", "Ron Paul", "Norman Vincent Peale", "William Penn", "Pablo Picasso", "Plato", "Plutarch", "Edgar Allan Poe", "Roman Polanski", "Colin Powell", "Steve Prefontaine", "Marcel Proust", "Ayn Rand", "Ronald Reagan", "Rainer Maria Rilke", "Tony Robbins", "Francois de La Rochefoucauld", "Will Rogers", "Jim Rohn", "Henry Rollins", "Mitt Romney", "Andy Rooney", "Eleanor Roosevelt", "Franklin D. Roosevelt", "Theodore Roosevelt", "Miguel Angel Ruiz", "Rumi", "John Ruskin", "Bertrand Russell", "Babe Ruth", "Carl Sagan", "Antoine de Saint-Exupery", "Jean-Paul Sartre", "Arthur Schopenhauer", "Robert H. Schuller", "Albert Schweitzer", "Lucius Annaeus Seneca", "Dr. Seuss", "William Shakespeare", "Tupac Shakur", "George Bernard Shaw", "Charlie Sheen", "Frank Sinatra", "Will Smith", "Socrates", "Thomas Sowell", "Robert Louis Stevenson", "W. Clement Stone", "Rabindranath Tagore", "Elizabeth Taylor", "Mother Teresa", "Margaret Thatcher", "Hunter S. Thompson", "Henry David Thoreau", "Alexis de Tocqueville", "Leo Tolstoy", "Lily Tomlin", "Brian Tracy", "Harry S. Truman", "Donald Trump", "Harriet Tubman", "Lana Turner", "Mark Twain", "Mike Tyson", "Lao Tzu", "Sun Tzu", "Paul Valery", "Jim Valvano", "Iyanla Vanzant", "Bill Vaughan", "Stevie Ray Vaughan", "Jesse Ventura", "Ken Venturi", "Jules Verne", "Sid Vicious", "Queen Victoria", "Gore Vidal", "Leonardo da Vinci", "Judith Viorst", "Virgil", "David Viscott", "Swami Vivekananda", "Voltaire", "Kurt Vonnegut", "Denis Waitley", "Alice Walker", "William Arthur Ward", "Andy Warhol", "Booker T. Washington", "George Washington", "Alan Watts", "John Wayne", "Orson Welles", "Mae West", "Ron White", "Walt Whitman", "Oscar Wilde", "Marianne Williamson", "Oprah Winfrey", "John Wooden", "Frank Lloyd Wright", "Steven Wright"]


output_authors = Array.new


authors_to_capture.each do |author|

	puts author

	output_author = Hash.new

	author.gsub!(' ', '_')

	output_author[:author] = author

	begin
		page_to_open = open(Domain + 'wiki/' + author)

		puts page_to_open.status

		if page_to_open.status != '404'

			author_content = Nokogiri::HTML(page_to_open)


			content = author_content.css('p')[0].text
			puts output_author[:content]  = content
			puts output_author[:image] = author_content.css('.image img')[0]['src'][2..-1]

			output_authors << output_author

		end
	rescue 
	end 

end

#puts write_to_file

header_string = '#!/bin/env ruby' + '\n' + '# encoding: utf-8 \n\n'

File.open('scrapped_author_info.rb', 'w') { |file| file.write(header_string + output_authors.to_s) }



