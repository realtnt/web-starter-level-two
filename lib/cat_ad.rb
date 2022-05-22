require 'sighting_list'
require 'date'

class CatAd
  attr_reader :title
  attr_reader :description
  attr_reader :image_url
  attr_reader :sightings

  def initialize(title, description, image_url = 'https://source.unsplash.com/random/480x640?cat') # String, String, String
    @title = title
    @description = description
    @image_url = image_url
    @sightings = SightingList.new
    @posted_on = DateTime.now
  end

  def set_ad_title(title)
    # No return value
  end

  def set_ad_description(description)
    # No return value
  end

  def set_image_url(image_url)
    # No return value
  end
end