require 'cat_ad'

class CatAdList
  def initialize
    @cat_ads = [] # CatAd[]
  end

  def list
    return @cat_ads
  end

  def get(index) # index is an int
    # returns a CatAd object
  end

  def add(cat_ad)
    @cat_ads << cat_ad
  end

  def remove(index) # index: Integer
    # Deletes the CatAd at index
  end

  def update(index, name, description) # index: Integer, name: String, description: String
    # Updates the entry at index with the new name, description and mobile
    # No return value
  end
end