class CreateWidgets < ActiveRecord::Migration
  def change
    create_table :widgets do |t|
      t.string :title
      t.string :media
      t.text :content
      t.string :url
      t.string :source
      t.string :ident

      t.timestamps
    end
  end
end
