class AddFaviconToWidgets < ActiveRecord::Migration
  def change
    add_column :widgets, :favicon, :string
  end
end
