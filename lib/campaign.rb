class Campaign
  attr_reader :title
  attr_reader :copy
  attr_reader :image_url
  attr_reader :keywords
  attr_reader :area_codes

  def initialize(title, copy, image_url = 'default', keywords, area_codes) # String, String, String, String
    @title = title
    @copy = copy
    @keywords = set_keywords(keywords)
    @area_codes = set_area_codes(area_codes)
  end

  def set_title(title)
    # No return value
  end

  def set_copy(copy)
    # No return value
  end

  def set_image_url(image_url)
    # No return value
  end

  def set_keywords(keywords) # keywords: String (comma separated)
    # Takes the String and splits it into an array of keywords.
    # No return value
  end

  def set_area_codes(area_codes) # area_codes: String (comma separated)
    # Takes the String and splits it into an array of area codes.
    # No return value
  end
end