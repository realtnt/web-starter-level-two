require "cat_list"

RSpec.describe CatList do
  it "start with an empty list" do
    expect(subject.list).to eq []
  end

  xit "adds cats" do
    subject.add("cat name", "cat about")
    lost_cat = double :LostCat
    expect(subject.list).to eq [lost_cat]
  end

  xit "removes examples" do
    subject.add("cat name 1", "cat about 1")
    subject.add("cat name 2", "cat about 2")
    subject.add("cat name 3", "cat about 3")
    subject.add("dog")
    subject.add("frog")
    subject.remove(1)
    expect(subject.list).to eq ["cat", "frog"]
  end

  xit "updates examples" do
    subject.add("cat")
    subject.add("dog")
    subject.add("frog")
    subject.update(1, "zebra")
    expect(subject.list).to eq ["cat", "zebra", "frog"]
  end

  xit "gets a single cat" do
    subject.add("cat")
    subject.add("dog")
    subject.add("frog")
    expect(subject.get(1)).to eq "dog"
  end
end
