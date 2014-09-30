class AddThumbToWidgets < ActiveRecord::Migration
  def change
    add_column :widgets, :thumb, :string
  end
end
