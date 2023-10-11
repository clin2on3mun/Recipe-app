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
    visit new_recipe_recipe_food_path(@recipe1)
  end

  it 'show the content of select' do
    expect(page).to have_content('Choose ingredients')
  end
  it 'show the button' do
    expect(page).to have_button('Add new ingredient')
  end
end
