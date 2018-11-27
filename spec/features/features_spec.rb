feature 'Feature Tests' do

  scenario 'User navigates to the index page' do
    visit ('/')
    expect(page).to have_content('Page Under Construction')
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

  scenario "User can add a new peep to Chitter" do
    sample_peep = 'This is a sample peep with my latest and greatest thought'
    visit ('/add_new_peep')
    expect(page).to have_field('peep')
    fill_in('peep', with: sample_peep)
    click_button 'Submit'
    expect(page).to have_content(sample_peep)
    p "This peep was created by a feature test, the content is: #{sample_peep}"
  end

end
