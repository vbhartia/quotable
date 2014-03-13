class CreateNotificationSettings < ActiveRecord::Migration
  def up
  	create_table :notification_settings do |t|
		t.boolean :daily_email

		t.belongs_to :user

		t.timestamps
	end
  end

  def down
  end
end
