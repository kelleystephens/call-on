feature "Adding a student" do
  background do
    Fabricate(:student, name: "Kelley")
  end
  scenario "Student successfully added" do
    visit "/students"
    fill_in "Name", with: "John"
    click_on "Add Student"
    expect(page).to have_content("John has been added to the list.")
    within("ul#students") do
      expect(page).to have_content("John")
    end
    expect(page.current_path).to eq("/students")
  end
  scenario "Skipping filling out form" do
    visit "/students"
    click_on "Add Student"
    expect(page).to have_content("Student could not be added.")
    expect(page).to have_content("Kelley")
    expect(page).to have_content("can't be blank")
  end
end
