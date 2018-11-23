feature 'Feature Tests' do

  scenario 'User navigates to the index page' do
    visit ('/')
    expect(page).to have_content('Chitter Index Page')
  end

  scenario 'User navigagtes to the peeps page' do
    visit('/peeps')
    expect(page).to have_content('this is my first peep')
    expect(page).to have_content('second time around')
    expect(page).to have_content('third time lucky?')
  end

  scenario 'User navigates to the add new peep page' do
    visit('/add_new_peep')
    expect(page).to have_content('Add a peep')
  end

end
