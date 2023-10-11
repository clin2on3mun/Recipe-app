require 'rails_helper'

RSpec.describe 'General shopping list specs', type: :feature do
  before(:each) do
    Recipe.delete_all

    @user = User.create!(name: 'becky', email: 'munana@gmail.com', password: 'abcxyz123',
                         password_confirmation: 'abcxyz123', confirmed_at: Time.now)
    @recipe1 = Recipe.create(user: @user, name: 'Kabsah', description: 'The best in the west', cooking_time: 45,
                             preparation_time: 40, public: true)
    @food = Food.create(user: @user, name: 'Test Food 101', measurement_unit: 'Gram', price: 9.99, quantity: 10)
    RecipeFood.create(food: @food, recipe: @recipe1, quantity: 1)
    puts @recipe1.id
    visit new_user_session_path # Assuming this is your sign-in page
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'
    visit general_shopping_lists_path
  end

  it 'see the title' do
    expect(page).to have_content('Food')
  end
  it 'see some page features' do
    expect(page).to have_content('Amount of food to buy: 0')
    expect(page).to have_content('Total value of food needed : $ 0')
  end
end
