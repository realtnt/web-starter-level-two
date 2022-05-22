require "cat_ad_list"

RSpec.describe CatAdList do
  it "start with an empty list" do
    cat_ad_list = CatAdList.new
    expect(cat_ad_list.list).to eq []
  end

  xit "adds cats" do
    lost_cat_fake = double :LostCat
    cat_list = CatList.new(lost_cat_fake)
    allow(lost_cat_fake).to receive(:new).and_return(lost_cat_fake)
    cat_list.add(
      'mumu 1', 
      'lost cat', 
      '01234555234', 
      'password'
    )
    expect(cat_list.list).to eq [lost_cat_fake]
  end

  xit "removes cat" do
    lost_cat_fake = double :LostCat
    cat_list = CatList.new(lost_cat_fake)
    allow(lost_cat_fake).to receive(:new).and_return(lost_cat_fake)
    cat_list.add(
      'mumu 1', 
      'lost cat', 
      '01234555234', 
      'password'
    )
    cat_list.add(
      'mumu 2', 
      'lost cat', 
      '01234555234', 
      'password'
    )
    cat_list.add(
      'mumu 3', 
      'lost cat', 
      '01234555234', 
      'password'
    )
    cat_list.remove(1)
    expect(cat_list.list).to eq [lost_cat_fake, lost_cat_fake]
  end

  xit "updates cats" do
    lost_cat_fake = double :LostCat
    cat_list = CatList.new(lost_cat_fake)
    allow(lost_cat_fake).to receive(:new).and_return(lost_cat_fake)
    allow(lost_cat_fake).to receive(:set_name)
    allow(lost_cat_fake).to receive(:set_description)
    allow(lost_cat_fake).to receive(:set_mobile)
    allow(lost_cat_fake).to receive(:add_sighting)
    allow(lost_cat_fake).to receive(:set_password)
    cat_list.add(
      'mumu 1', 
      'lost cat', 
      '01234555234', 
      'password'
    )
    cat_list.add(
      'mumu 2', 
      'lost cat', 
      '01234555234', 
      'password'
    )
    cat_list.add(
      'mumu 3', 
      'lost cat', 
      '01234555234', 
      'password'
    )
    cat_list.update(
      1, 
      "updated cat", 
      "cat updated", 
      "099999999",
      "",
      ""
    )
    expect(cat_list.list).to eq [lost_cat_fake, lost_cat_fake, lost_cat_fake]
    expect(cat_list.get(1)).to eq(lost_cat_fake)
  end

  xit "gets a single cat" do
    lost_cat_fake = double :LostCat
    cat_list = CatList.new(lost_cat_fake)
    allow(lost_cat_fake).to receive(:new).and_return(lost_cat_fake)
    allow(lost_cat_fake).to receive(:name=)
    allow(lost_cat_fake).to receive(:description=)
    allow(lost_cat_fake).to receive(:mobile=)
    allow(lost_cat_fake).to receive(:password=)
    cat_list.add(
      'mumu 1', 
      'lost cat', 
      '01234555234', 
      'password'
    )
    cat_list.add(
      'mumu 2', 
      'lost cat', 
      '01234555234', 
      'password'
    )
    cat_list.add(
      'mumu 3', 
      'lost cat', 
      '01234555234', 
      'password'
    )
    expect(cat_list.get(1)).to eq lost_cat_fake
  end
end
