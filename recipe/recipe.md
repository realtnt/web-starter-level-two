# Lost Cats Web Design Recipe (Level Two)

## 1. Describe the Problem

_Put or write the user stories here. Add any clarifying notes you might have._

> As a user
>
> So that I can find my cat that I lost
>
> I want to post an advert for a lost cat with some description of the cat, and my telephone number so people can contact me

> As a user
>
> So that I can help others find their lost cats
>
> I want to see all of the lost cat adverts

> As a user
>
> So that I can focus on the yet not-found cats
>
> I want to delete adverts for cats that have been found

> As a user
>
> So that I can update lost cat adverts with potential sightings
>
> I want to update adverts

> As a user
>
> So that I can protect my cat adverts from weird people
>
> I want to give a password with each advert, and only people who give the right password can update or delete that advert

## 2. Design the Interface

_This is the fun part! Use excalidraw.com or a similar tool to design some
wireframes (rough sketches of the user interface). Include interactions and
transitions between pages — those are the most critical part._

![Catboard Design](./catboard.png)

## 3. Design the Data Model Classes

_These classes should store and manage the data the server will hold._
_Include the initializer and public methods with all parameters and return values._

```ruby

###
# CatAdList Class

class CatAdList
  def initialize
    @cat_ads = [] # CatAd[]
  end

  def list
    # Returns @cat_ads
  end

  def get(index) # index is an int
    # returns a CatAd object
  end

  def add(cat_ad) # cat_ad: CatAd 
    # adds a CatAd obj to @cat_ads
    # No return value
  end

  def remove(index) # index: Integer
    # Deletes the CatAd at index
  end

  def update(index, name, description) # index: Integer, name: String, description: String
    # Updates the entry at index with the new name, description and mobile
    # No return value
  end
end

###
# CatAd class

class CatAd
  attr_reader :title
  attr_reader :description
  attr_reader :image_url
  attr_reader :sightings

  def initialize(title, description, image_url = 'default_url') # String, String, String
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

###
# SightingList Class

class SightingList
  def initialize
    @sightings = [] # Sightings[]
  end

  def list
    # Returns @sightings
  end

  def get(index) # index is an int
    # returns a Sighting object
  end

  def add(signting) # sighting: Sighting
    # adds a Sighting obj to @sightings
    # No return value
  end

  def remove(index) # index: Integer
    # Deletes the sighting at index
  end

  def update(index, spotted_on, location, details)  # index: Integer
                                                    # spotted_on: DateTime
                                                    # location: String
                                                    # details: String
    # Updates the sighting at index with the arguments passed.
    # No return value
  end
end

###
# Sighting Class

class Sighting
  attr_reader :spotted_on
  attr_reader :location
  attr_reader :details

  def initialize(spotted_on, location, details) # DateTime, String, String
    @spotted_on = spotted_on
    @location = location
    @details = details
    @posted_on = DateTime.now
  end

  def set_location(location) # String
    # No return value
  end

  def set_details(details) # String
    # No return value
  end

  def set_spotted_on(spotted_on) # DateTime
    # No return value
  end
end

###
# CampaignList Class

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

###
# Campaign class

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

###
# User class

class User
  attr_reader :email
  attr_reader :password
  attr_reader :name
  attr_reader :cat_ads
  attr_reader :campaign_list

  def initialize(email, password, name, mobile, advertiser = false) 
            # email: String, name: String, mobile: String, advertiser: bool
    @email = email
    @password = password
    @name = name
    @mobile = mobile
    @advertiser = advertiser
    @cat_ads = CatAdList.new
    @campaigns = CampaignList.new
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

  def is_advertiser?
    # Return true if advertiser, false otherwise (@advertiser)
  end

  def is_ad_owner?(cat_ad) # cat_ad: CatAd
    # Returns true if cat_ad is in @cat_ads
  end

  def is_campaign_owner?(campaign) # campaign: Campaign
    # Returns true if campaign is in @campaigns
  end

  def authenticate(password) # password: String
    # Check if password is correct
    # Returns true if password matches user's password. False otherwise
  end
end

###
# UserList Class

class UserList
  def initialize
    @users = [] # User[]
  end

  def list
    # Returns @users
  end

  def get(index) # index: Int
    # returns a User object
  end

  def add(user) # user: User
    # adds a User obj to @user
    # No return value
  end

  def remove(index) # index: Integer
    # Deletes the user obj at given index
  end

  def update(index, email, password, name, mobile)    # index: Integer, 
                                                      # email: String, 
                                                      # password: String,
                                                      # name: String,
                                                      # mobile: String
    # Updates the User obj at index with the new arguments
    # No return value
  end

  def find(email) # email: String
    # uses the email to find the User object it belongs to
    # returns a User object
  end

  def exists?(email) # email: String
    # checks to see if the email has already been used for an account
    # returns true or false
  end
end

```

_Check them against these rules:_

> 1. Do they represent a collection or collections of data?
> 2. Does each collection have relevant methods to:
>    1. List out all items in the resource
>    2. Create an item (C)
>    3. Get a single item (R)
>    4. Update an item (U)
>    5. Delete an item (D)
> 3. Is it possible to construct a realistic data model just by using simple
>    data types? (strings, integers, booleans)

## 4. Design the Web API (Requests)

_Design requests that perform each of the key operations on your data model._
_Map them to the methods or code snippets in your data model._

```ruby
# EXAMPLE

# INDEX
# Request: GET /lostcats
cat_list.list

# CREATE
# POST /lostcats
# With data: { title: "Ginger cat", description: "A good ginger kitten", mobile: "01234123457" }
cat = LostCat.new(title, description, mobile)
cat_list.add(cat)

# READ
# GET /lostcats/:index
cat_list.get(index)

# UPDATE
# PATCH /lostcats/:index
# With data: { title: "Ginger cat", description: "A good ginger kitten", mobile: "01234123457" }
cat = LostCat.new(title, description, mobile)
cat_list.update(index, entry)

# DELETE
# DELETE /lostcats/:index
cat_list.remove(index)
```

> Remember:
> GET: Getting a single item or a list of items
> POST: Adding an item
> PATCH: Updating an item
> DELETE: Deleting an item

## 5. Create Examples of User Interactions

_Create examples of user interactions and expectations._

```ruby
# As you learn the testing tools you might start writing with realistic test
# code here, but at the start it's OK if it's just English or made up code.

# View no entries
visit "/lostcats"
# User sees: There are no lost cats.

# Add an entry
visit "/lostcats"
click link "Add Lost Cat Entry"
enter "Ginger cat" into "Title" field
enter "A good ginger kitten." into "Description" field
enter "0123456789" into "Mobile" field
click button "Post"
# User sees the lost cat list. (homepage)


```

## 6. Test-Drive the Behaviour

_Follow this cycle:_

1. Add a feature test in `/spec/feature/` (RED)
2. Implement the behaviour in `app.rb`
3. Does it pass without data model changes? (GREEN) Then skip to step 6.
4. Otherwise, add a unit test for the data model to `/spec/unit` (RED)
5. Implement the behaviour in your data model class. (GREEN)
6. Apply any refactors to improve the structure of the code. (REFACTOR)  
   Run `rubocop` as part of this.
7. Go back to step 1.

