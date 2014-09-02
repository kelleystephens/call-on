feature "Adding a student" do
  scenario "Student successfully added" do
    pending "implementaion"
    visit "/" #index
    fill_in "Name", with: "John"
    click_on "Add Student" #create, then index
    page.should have_content("John")
    current_path.should == students_path
  end

  scenario "Skipping filling out form" do
    pending "implementaion"
    visit "/"
    click_on "Add Student"
    page.should have_content("Student could not be added.")
    page.should have_content("can't be blank", on: "Name")
  end
end
