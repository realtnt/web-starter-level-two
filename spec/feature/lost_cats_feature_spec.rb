RSpec.describe "Lost Cats Feature", type: :feature do
  it "starts with an empty list of lost cats" do
    visit "/lostcats"
    expect(page).to have_content "There are no lost cats."
  end

  it "adds and lists lost cats" do
    visit "/lostcats"
    click_link "Add Lost Cat"
    fill_in "Name", with: "Ginger cat"
    fill_in "Description", with: "A good ginger kitten."
    fill_in "Mobile", with: "0123456789"
    click_button "Save"
    expect(page).to have_content "Ginger cat"
    expect(page).to have_content "A good ginger kitten."
  end

  it "adds and lists multiple lost cats" do
    visit "/lostcats"
    click_link "Add Lost Cat"
    fill_in "Name", with: "Ginger cat"
    fill_in "Description", with: "A good ginger kitten."
    fill_in "Mobile", with: "0123456789"
    click_button "Save"
    click_link "Add Lost Cat"
    fill_in "Name", with: "Tabby cat"
    fill_in "Description", with: "A good ginger kitten."
    fill_in "Mobile", with: "0123456789"
    click_button "Save"
    click_link "Add Lost Cat"
    fill_in "Name", with: "Black cat"
    fill_in "Description", with: "A good ginger kitten."
    fill_in "Mobile", with: "0123456789"
    click_button "Save"
    expect(page).to have_content "Tabby cat"
    expect(page).to have_content "Ginger cat"
    expect(page).to have_content "Black cat"
  end

  it "deletes lost cats that have been found!" do
    visit "/lostcats"
    click_link "Add Lost Cat"
    fill_in "Name", with: "Ginger cat"
    fill_in "Description", with: "A good ginger kitten."
    fill_in "Mobile", with: "0123456789"
    click_button "Save"
    click_link "Add Lost Cat"
    fill_in "Name", with: "Tabby cat"
    fill_in "Description", with: "A good ginger kitten."
    fill_in "Mobile", with: "0123456789"
    click_button "Save"
    click_link "Add Lost Cat"
    fill_in "Name", with: "Black cat"
    fill_in "Description", with: "A good ginger kitten."
    fill_in "Mobile", with: "0123456789"
    click_button "Save"

    click_button "Delete Black"

    expect(page).to have_content "Ginger"
    expect(page).not_to have_content "Black"
    expect(page).to have_content "Tabby"
  end

  it "updates lost cats" do
    visit "/lostcats"
    click_link "Add Lost Cat"
    fill_in "Name", with: "Ginger cat"
    fill_in "Description", with: "A good ginger kitten."
    fill_in "Mobile", with: "0123456789"
    click_button "Save"
    click_link "Add Lost Cat"
    fill_in "Name", with: "Tabby cat"
    fill_in "Description", with: "A good ginger kitten."
    fill_in "Mobile", with: "0123456789"
    click_button "Save"
    click_link "Add Lost Cat"
    fill_in "Name", with: "Black cat"
    fill_in "Description", with: "A good ginger kitten."
    fill_in "Mobile", with: "0123456789"
    click_button "Save"

    click_link "Black cat:"
    click_link "Edit"
    fill_in "Name", with: "White cat"
    fill_in "Description", with: "A good ginger kitten."
    fill_in "Mobile", with: "0123456789"
    click_button "Save"

    expect(page).to have_content "White"
    expect(page).not_to have_content "Black"
    expect(page).to have_content "Tabby"
    expect(page).to have_content "Ginger"
  end
end
