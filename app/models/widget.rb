class Widget < ActiveRecord::Base
  attr_accessible :content, :ident, :source, :title, :media, :url
  acts_as_commontable
end
