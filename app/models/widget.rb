class Widget < ActiveRecord::Base
  attr_accessible :content, :ident, :source, :title, :media, :url
  acts_as_commontable

  def next
    self.class.where("id > ?", id).first
  end

  def prev
    self.class.where("id < ?", id).last
  end

end
