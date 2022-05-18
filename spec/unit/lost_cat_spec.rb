require 'lost_cat'

RSpec.describe LostCat do
  cat_1 = LostCat.new('mumu', 'lost cat')
  it 'should return the name' do
    expect(cat_1.name).to eq 'mumu'
  end

  it 'should return the about' do
    expect(cat_1.about).to eq 'lost cat'
  end
end
