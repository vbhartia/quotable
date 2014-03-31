class AddQuotesAssociatedAuthors < ActiveRecord::Migration
  def up
    create_table :author_associated_quotes do |t|
      t.belongs_to :author
      t.belongs_to :quote
      t.datetime :assign_date
      t.timestamps
    end
  end

  def down
  end
end
