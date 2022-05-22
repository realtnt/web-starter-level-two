require 'cat_ad_list'
require 'campaign_list'

class User
  attr_reader :id
  attr_reader :email
  attr_reader :password
  attr_reader :name
  attr_reader :mobile
  attr_reader :cat_ads
  attr_reader :campaign_list

  def initialize(email:, password:, name:, mobile:, advertiser: false) 
            # email: String, name: String, mobile: String, advertiser: bool
    @email = email
    @password = password
    @name = name
    @mobile = mobile
    @advertiser = advertiser
    @cat_ads = CatAdList.new
    @campaigns = CampaignList.new
    @id = @email
  end

  def set_email(email)
    # No return value
  end

  def set_password(password)
    # No return value
  end

  def set_mobile(mobile)
    # No return value
  end

  def set_name # keywords: String (comma separated)
    # Takes the String and splits it into an array of keywords.
    # No return value
  end

  def advertiser?
    # Return true if advertiser, false otherwise (@advertiser)
  end

  def ad_owner?(cat_ad) # cat_ad: CatAd
    # Returns true if cat_ad is in @cat_ads
  end

  def campaign_owner?(campaign) # campaign: Campaign
    # Returns true if campaign is in @campaigns
  end

  def authenticate(password) # password: String
    # Check if password is correct
    # Returns true if password matches user's password. False otherwise
  end
end