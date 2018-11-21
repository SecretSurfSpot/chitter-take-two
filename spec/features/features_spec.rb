feature 'Index' do
  scenario "User navigates to the index page" do
    visit ('/')
    expect(page).to have_content('Welcome to Chitter')
  end
end
