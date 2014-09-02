feature "Adding a student" do
  background do
    Fabricate(:student, name: "Kelley")
  end
  scenario "Student successfully added" do
    visit "/"
    fill_in "Name", with: "John"
    click_on "Add Student"
    expect(page).to have_content("John")
    expect(page.current_path).to eq("/students")
  end

  scenario "Skipping filling out form" do
    pending "implementation"
    visit "/"
    click_on "Add Student"
    expect(page).to have_content("Student could not be added.")
    expect(page).to have_content("can't be blank", on: "Name")
  end
end
