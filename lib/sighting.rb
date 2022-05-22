require 'date'

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