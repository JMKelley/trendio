class AddColumnUsernameToWidgets < ActiveRecord::Migration
  def change
  	add_column :widgets, :username, :string
  end
end
