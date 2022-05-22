require 'sighting'

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