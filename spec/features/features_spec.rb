feature 'Feature Tests' do
  scenario 'User navigates to the index page' do
    visit ('/')
    expect(page).to have_content('Chitter Index Page')
  end


  scenario 'User navigagtes to the peeps page' do
    visit('/peeps')
    expect(page).to have_content "first peep"
  end

end
