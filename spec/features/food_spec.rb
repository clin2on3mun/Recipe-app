require 'rails_helper'

RSpec.describe 'Food specs', type: :feature do
  before(:each) do
    Food.delete_all
    User.delete_all
    @user = User.create!(name: 'Munana', email: 'munana@gmail.com', password: 'abcxyz123',
                         password_confirmation: 'abcxyz123', confirmed_at: Time.now)
    Food.create(user: @user, name: 'Test Food 101', measurement_unit: 'Gram', price: 9.99, quantity: 10)
    Food.create(user: @user, name: 'Test Food 102', measurement_unit: 'Gram', price: 9.99, quantity: 10)

    visit new_user_session_path # Assuming this is your sign-in page
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'
    visit foods_path
  end

  it 'see the title' do
    expect(page).to have_content('Food')
  end
  it 'see the grams in measurement_unit column in table' do
    expect(page).to have_content('Gram')
  end
  it 'when I click on add food it should lead to add new food page' do
    click_on 'Add food'
    expect(page).to have_content('Add New Food')
    expect(page).to have_button('Create food')
  end
end
