class AddVotesToQuotes < ActiveRecord::Migration
  def up
    create_table :votes do |t|
      t.belongs_to :user
      t.belongs_to :quote
      t.datetime :vote_date
  	end
  end
end
