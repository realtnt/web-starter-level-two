require 'cat_ad'

RSpec.describe CatAd do
  ad1 = CatAd.new('mumu', 'lost cat')
  it 'should return the title' do
    expect(ad1.title).to eq 'mumu'
  end

  it 'should return the description' do
    expect(ad1.description).to eq 'lost cat'
  end

  it 'should return the image url' do
    expect(ad1.image_url).to eq 'https://source.unsplash.com/random/480x640?cat'
  end
end
