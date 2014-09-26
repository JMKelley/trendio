class Widget < ActiveRecord::Base
  attr_accessible :content, :ident, :source, :title, :media, :url, :tag_list
  acts_as_commontable
  acts_as_taggable

  def next
    self.class.where("id > ?", id).first
  end

  def prev
    self.class.where("id < ?", id).last
  end

end
