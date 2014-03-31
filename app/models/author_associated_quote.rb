class AuthorAssociatedQuote < ActiveRecord::Base

	belongs_to :author
  	belongs_to :quote

end