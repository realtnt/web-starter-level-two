RSpec.describe "Lost Cats Feature", type: :feature do
  it "starts with an empty list of lost cats" do
    visit "/lostcats"
    expect(page).to have_content "There are no lost cats."
  end

  it "adds and lists lost cats" do
    visit "/lostcats"
    click_link "Add Lost Cat."
    fill_in "Name", with: "Tom"
    fill_in "About", with: "Ginger, 0123456677"
    click_button "Add Lost Cat"
    expect(page).to have_content "Tom"
    expect(page).to have_content "Ginger, 0123456677"
  end

  it "adds and lists multiple animals" do
    visit "/animals"
    click_link "Add Animal"
    fill_in "Species", with: "Frog"
    click_button "Add Animal"
    click_link "Add Animal"
    fill_in "Species", with: "Cat"
    click_button "Add Animal"
    click_link "Add Animal"
    fill_in "Species", with: "Dog"
    click_button "Add Animal"
    expect(page).to have_content "Frog"
    expect(page).to have_content "Cat"
    expect(page).to have_content "Dog"
  end

  it "deletes lost cat" do
    visit "/lostcats"
    click_link "Add Lost Cat"
    fill_in "name", with: "Tom"
    click_button "Add Lost Cat"
    click_link "Add Lost Cat"
    fill_in "name", with: "Jerry"
    click_button "Add Lost Cat"
    click_link "Add Lost Cat"
    fill_in "name", with: "eric"
    click_button "Add Lost Cat"

    click_button "Delete Jerry"

    expect(page).to have_content "Tom"
    expect(page).not_to have_content "Jerry"
    expect(page).to have_content "eric"
  end

  it "updates animals" do
    visit "/animals"
    click_link "Add Animal"
    fill_in "Species", with: "Frog"
    click_button "Add Animal"
    click_link "Add Animal"
    fill_in "Species", with: "Cat"
    click_button "Add Animal"
    click_link "Add Animal"
    fill_in "Species", with: "Dog"
    click_button "Add Animal"

    click_link "Edit Cat"
    fill_in "Species", with: "Zebra"
    click_button "Update Animal"

    expect(page).to have_content "Frog"
    expect(page).not_to have_content "Cat"
    expect(page).to have_content "Zebra"
    expect(page).to have_content "Dog"
  end
end
