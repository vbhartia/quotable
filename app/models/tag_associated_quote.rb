class TagAssociatedQuote < ActiveRecord::Base
	belongs_to :tag
  	belongs_to :quote

end