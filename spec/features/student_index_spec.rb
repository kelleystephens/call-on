feature "Student Index Page" do
  scenario "is displayed when loading the site" do
    visit '/students'
    expect(page).to have_content("Students:")
  end

  scenario "displays student and not called on" do
    Fabricate(:student, name: "Kelley")
    visit '/students'
    expect(page).to have_content('Kelley')
    expect(page).to have_content('Never called on')
  end

  scenario "displays student and called-on date" do
    date = DateTime.now.prev_day
    Fabricate(:student, name: "Sarah", called_on: date)
    visit '/students'
    expect(page).to have_content('Sarah')
    expect(page).to have_content('1 day ago')
  end
end
