feature "Picking a student" do
  background do
    Fabricate(:student, name: "Kelley")
    Fabricate(:student, name: "Sarah", called_on: "2014-09-03")
    Fabricate(:student, name: "John", called_on: "2014-09-01")
  end
  scenario "Student successfully picked" do
    visit "/students"
    click_on "Pick Student"
    expect(page).to have_content("has been chosen.")
    expect(page.current_path).to eq("/students")
  end
end
