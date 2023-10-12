require 'rails_helper'

RSpec.describe 'Recipe specs', type: :feature do
  before(:each) do
    Recipe.delete_all

    @user = User.create!(name: 'becky', email: 'munana@gmail.com', password: 'abcxyz123',
                         password_confirmation: 'abcxyz123', confirmed_at: Time.now)
    @recipe1 = Recipe.create(user: @user, name: 'Kabsah', description: 'The best in the west', cooking_time: 45,
                             preparation_time: 40, public: true)
    visit new_user_session_path # Assuming this is your sign-in page
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'
    visit recipes_path
  end

  it 'see the title' do
    expect(page).to have_content('My Recipes')
    expect(page).to have_content('The best in the west')
  end

  it 'see the recipe details' do
    visit recipe_path(@recipe1) # Visit the show page for @recipe1

    # Test that the recipe details are displayed correctly
    expect(page).to have_content('Kabsah')
    expect(page).to have_content('The best in the west')
    expect(page).to have_content('Preparation time') # Update with actual preparation time
    expect(page).to have_content('Cooking time') # Update with actual cooking time
  end
  it 'create new recipe' do
    click_on 'Add Recipe'
    expect(page).to have_content('Add New Recipe')
    expect(page).to have_button('Add new recipe')
    expect(page).to have_content('Made recipe public')
  end
end
