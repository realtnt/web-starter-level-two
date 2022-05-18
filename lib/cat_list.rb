require 'lost_cat'

class CatList
  def initialize
    @cats = []
  end

  def list
    return @cats
  end

  def add(name, about)
    lost_cat = LostCat.new(name, about)
    @cats << lost_cat
  end

  def remove(index)
    p index
    @cats.delete_at(index)
  end

  def update(index, name, about)
    @cats[index].name = name
    @cats[index].about = about
  end

  def get(index)
    return @cats[index]
  end
end
