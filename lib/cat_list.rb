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
    @cats << @lost_cat.new(name, description, mobile)
  end

  def remove(index)
    @cats.delete_at(index)
  end

  def update(index, name, description, mobile)
    @cats[index].name = name
    @cats[index].description = description
    @cats[index].mobile = mobile
  end

  def get(index)
    return @cats[index]
  end
end
