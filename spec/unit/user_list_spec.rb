require "user"

RSpec.describe UserList do
  it "start with an empty list" do
    expect(subject.list).to eq []
  end

  it "adds cats" do
    cat_ad_fake = double :CatAd
    cat_ad_list = CatAdList.new
    allow(cat_ad_fake).to receive(:new).and_return(cat_ad_fake)
    cat_ad_list.add( cat_ad_fake)
    expect(cat_ad_list.list).to eq [cat_ad_fake]
  end
end
