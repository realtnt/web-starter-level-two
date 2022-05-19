require "cat_list"

RSpec.describe CatList do
  it "start with an empty list" do
    expect(subject.list).to eq []
  end

  it "adds cats" do
    lost_cat_fake = double :LostCat
    cat_list = CatList.new(lost_cat_fake)
    allow(lost_cat_fake).to receive(:new).and_return(lost_cat_fake)
    cat_list.add("cat name", "cat description", "012345566")
    expect(cat_list.list).to eq [lost_cat_fake]
  end

  it "removes cat" do
    lost_cat_fake = double :LostCat
    cat_list = CatList.new(lost_cat_fake)
    allow(lost_cat_fake).to receive(:new).and_return(lost_cat_fake)
    cat_list.add("cat name 1", "cat description", "012345566")
    cat_list.add("cat name 2", "cat description", "012345566")
    cat_list.add("cat name 3", "cat description", "012345566")
    cat_list.remove(1)
    expect(cat_list.list).to eq [lost_cat_fake, lost_cat_fake]
  end

  it "updates cats" do
    lost_cat_fake = double :LostCat
    cat_list = CatList.new(lost_cat_fake)
    allow(lost_cat_fake).to receive(:new).and_return(lost_cat_fake)
    allow(lost_cat_fake).to receive(:name=)
    allow(lost_cat_fake).to receive(:description=)
    allow(lost_cat_fake).to receive(:mobile=)
    cat_list.add("cat name 1", "cat description", "012345566")
    cat_list.add("cat name 2", "cat description", "012345566")
    cat_list.add("cat name 3", "cat description", "012345566")
    cat_list.update(1, "updated cat", "cat updated", "099999999")
    expect(cat_list.list).to eq [lost_cat_fake, lost_cat_fake, lost_cat_fake]
    expect(cat_list.get(1)).to eq(lost_cat_fake)
  end

  it "gets a single cat" do
    lost_cat_fake = double :LostCat
    cat_list = CatList.new(lost_cat_fake)
    allow(lost_cat_fake).to receive(:new).and_return(lost_cat_fake)
    allow(lost_cat_fake).to receive(:name=)
    allow(lost_cat_fake).to receive(:description=)
    allow(lost_cat_fake).to receive(:mobile=)
    cat_list.add("cat name 1", "cat description", "012345566")
    cat_list.add("cat name 2", "cat description", "012345566")
    cat_list.add("cat name 3", "cat description", "012345566")
    expect(cat_list.get(1)).to eq lost_cat_fake
  end
end
