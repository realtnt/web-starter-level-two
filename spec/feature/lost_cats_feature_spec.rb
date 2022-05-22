RSpec.describe "Lost Cats Feature", type: :feature do
  it "starts with an empty list of ads" do
    visit "/"
    expect(page).to have_content "There are no ads yet!"
  end

  it "signs up user and shows profile page" do
    visit "/registrations/signup"
    fill_in "Name", with: "Tom Jones"
    fill_in "Email", with: "tomjones@gmail.com"
    fill_in "Mobile", with: "0123456789"
    fill_in "Password", with: "password"
    click_button "Save"
    expect(page).to have_content "Profile"
    expect(page).to have_content "tomjones@gmail.com"
  end


  xit "adds and lists ads" do
    visit "/"
    click_link "Add Advert"
    fill_in "Title", with: "Ginger cat"
    fill_in "Description", with: "A good ginger kitten."
    click_button "Save"
    expect(page).to have_content "Ginger cat"
    expect(page).to have_content "A good ginger kitten."
  end

  xit "adds and lists multiple lost cats" do
    visit "/lostcats"
    click_link "Add Advert"
    fill_in "Name", with: "Ginger cat"
    fill_in "Description", with: "A good ginger kitten."
    fill_in "Mobile", with: "0123456789"
    fill_in "Password", with: "pass"
    click_button "Save"
    click_link "Add Advert"
    fill_in "Name", with: "Tabby cat"
    fill_in "Description", with: "A good ginger kitten."
    fill_in "Mobile", with: "0123456789"
    fill_in "Password", with: "pass"
    click_button "Save"
    click_link "Add Advert"
    fill_in "Name", with: "Black cat"
    fill_in "Description", with: "A good ginger kitten."
    fill_in "Mobile", with: "0123456789"
    fill_in "Password", with: "pass"
    click_button "Save"
    expect(page).to have_content "Tabby cat"
    expect(page).to have_content "Ginger cat"
    expect(page).to have_content "Black cat"
  end

  xit "deletes lost cats that have been found!" do
    visit "/lostcats"
    click_link "Add Advert"
    fill_in "Name", with: "Ginger cat"
    fill_in "Description", with: "A good ginger kitten."
    fill_in "Mobile", with: "0123456789"
    fill_in "Password", with: "pass"
    click_button "Save"
    click_link "Add Advert"
    fill_in "Name", with: "Tabby cat"
    fill_in "Description", with: "A good ginger kitten."
    fill_in "Mobile", with: "0123456789"
    fill_in "Password", with: "pass"
    click_button "Save"
    click_link "Add Advert"
    fill_in "Name", with: "Black cat"
    fill_in "Description", with: "A good ginger kitten."
    fill_in "Mobile", with: "0123456789"
    fill_in "Password", with: "pass"
    click_button "Save"

    find('section[name="Black cat"]').click_button "Delete"

    expect(page).to have_content "Ginger"
    expect(page).not_to have_content "Black"
    expect(page).to have_content "Tabby"
  end

  xit "updates lost cats" do
    visit "/lostcats"
    click_link "Add Advert"
    fill_in "Name", with: "Ginger cat"
    fill_in "Description", with: "A good ginger kitten."
    fill_in "Mobile", with: "0123456789"
    fill_in "Password", with: "pass"
    click_button "Save"
    click_link "Add Advert"
    fill_in "Name", with: "Tabby cat"
    fill_in "Description", with: "A good ginger kitten."
    fill_in "Mobile", with: "0123456789"
    fill_in "Password", with: "pass"
    click_button "Save"
    click_link "Add Advert"
    fill_in "Name", with: "Black cat"
    fill_in "Description", with: "A good ginger kitten."
    fill_in "Mobile", with: "0123456789"
    fill_in "Password", with: "pass"
    click_button "Save"

    find('section[name="Black cat"]').click_link "Edit"
    fill_in "Name", with: "White cat"
    fill_in "Description", with: "A good ginger kitten."
    fill_in "Mobile", with: "0123456789"
    click_button "Save"

    expect(page).to have_content "White cat"
    expect(page).not_to have_content "Black cat"
  end

  xit "adds sightings" do
    visit "/lostcats"
    click_link "Add Advert"
    fill_in "Name", with: "Ginger cat"
    fill_in "Description", with: "A good ginger kitten."
    fill_in "Mobile", with: "0123456789"
    fill_in "Password", with: "pass"
    click_button "Save"
    find('section[name="Ginger cat"]').click_link "Details"
    click_link "Add Sighting"
    fill_in "sighting", with: "High Street at 10pm Tuesday"
    click_button "Submit"
    expect(page).to have_content "High Street at 10pm Tuesday"
  end

  xit "adds sightings" do
    visit "/lostcats"
    click_link "Add Advert"
    fill_in "Name", with: "Ginger cat"
    fill_in "Description", with: "A good ginger kitten."
    fill_in "Mobile", with: "0123456789"
    fill_in "Password", with: "password"
    click_button "Save"
    find('section[name="Ginger cat"]').click_link "Edit"
    fill_in "Name", with: "White cat"
    fill_in "Description", with: "A good ginger kitten."
    fill_in "Mobile", with: "0123456789"
    fill_in "Password", with: "password"
    click_button "Save"
    expect(page).to have_content "High Street at 10pm Tuesday"
  end
end
