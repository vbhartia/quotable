class CreateQuotes < ActiveRecord::Migration
  def up
  	create_table :quotes do |t|
		t.text :quote_text
		t.text :author
		t.text :url_slug

		t.timestamps
	end

  end

  def down
  end
end
