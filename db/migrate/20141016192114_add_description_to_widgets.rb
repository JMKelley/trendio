class AddDescriptionToWidgets < ActiveRecord::Migration
  def change
    add_column :widgets, :description, :text
  end
end
