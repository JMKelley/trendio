class Widget < ActiveRecord::Base
  attr_accessible :content, :ident, :source, :title, :media, :url, :tag_list, :thumb
  acts_as_commontable
  acts_as_taggable

  def next
    self.class.where("id > ?", id).first
  end

  def prev
    self.class.where("id < ?", id).last
  end

  def populate!
  	data = $embedly.oembed(url: url)
  	widget = data[0]

    # Content of the title "Miley Cyrus Twerks"
  	self.title = widget.title
    # Photo, Video, Audio
  	self.media = widget.type
    # Vine, Instagram, Vimeo
  	self.source = widget.provider_name.downcase
    # Thumbnail
    self.thumb = widget.thumbnail_url

  	self.content = case media
  	when "video"
  		widget.html
  	when "image"
  	when "photo"
  		widget.url
  	end

  end

end
