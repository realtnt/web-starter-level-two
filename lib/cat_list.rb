require 'lost_cat'

class CatList
  def initialize(lost_cat = LostCat)
    @cats = []
    @lost_cat = lost_cat
  end

  def list
    return @cats
  end

  def add(name, description, mobile)
    @cats << @lost_cat.new(name, description, mobile, [], 'password')
  end

  def remove(index)
    @cats.delete_at(index)
  end

  def update(index:, name: '', description: '', mobile: '', sighting: '', password: '')
    return false unless password == @cats[index].password
    @cats[index].name = name unless name.empty?
    @cats[index].description = description unless description.empty?
    @cats[index].mobile = mobile unless mobile.empty?
    @cats[index].sightings << sighting unless sighting.empty?
  end

  def get(index)
    return @cats[index]
  end
end
