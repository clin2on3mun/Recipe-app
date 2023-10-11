require 'rails_helper'
require 'rspec/rails'

RSpec.describe RecipeFood, type: :model do
  let(:recipe) { Recipe.create(name: 'Kabsah') }
  let(:food) { Food.create(name: 'Rice', price: 10.0) }

  subject { described_class.new(quantity: 5, recipe: recipe, food: food) }

  describe 'validations' do
    it 'Is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'Is not valid without a quantity' do
      subject.quantity = nil
      expect(subject).to_not be_valid
    end

    it 'Is not valid with a non-positive quantity' do
      subject.quantity = 0
      expect(subject).to_not be_valid

      subject.quantity = -1
      expect(subject).to_not be_valid
    end
  end
end
