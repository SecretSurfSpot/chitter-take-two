feature "Index" do
  scenario "User navigates to the index page" do
    sample_text = 'Welcome to Chitter'
    visit '/'
    expect(page).to have_content(sample_text)
  end
end
