class AddDescriptionToWidgets < ActiveRecord::Migration
  def change
    add_column :widgets, :description, :string
  end
end
