class CreateUserQuote < ActiveRecord::Migration
  def up
	  create_table :user_associated_quotes do |t|
      t.belongs_to :user
      t.belongs_to :quote
      t.datetime :assign_date
      t.timestamps
    end

  end

  def down
  end
end
