require 'campaign'

class CampaignList
  def initialize
    @campaigns = [] # Campaign[]
  end

  def list
    # Returns @campaigns
  end

  def get(index) # index is an int
    # returns a Campaign object
  end

  def add(campaign) # campaign: Campaign
    # adds a Campaign obj to @campaigns
    # No return value
  end

  def remove(index) # index: Integer
    # Deletes the campaign at given index
  end

  def update(index, title, copy, keywords, area_codes) # index: Integer, 
                                                # copy: String, 
                                                # keywords: String,
                                                # area_codes: String,
    # Updates the Campaign obj at index with the new arguments
    # No return value
  end
end