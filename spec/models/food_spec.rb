require 'rails_helper'

RSpec.describe Food, type: :model do
  let(:user) { User.create(name: 'Munana', email: 'munana@rwanda.com', password: '111111') }

  subject do
    Food.new(
      name: 'Rice',
      measurement_unit: 'grams',
      price: 10.0,
      quantity: 100.0,
      user: user # Set the user association to the user variable you created
    )
  end

  describe 'validations' do
    it 'Is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'Is not valid without a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'Is not valid without a measurement unit' do
      subject.measurement_unit = nil
      expect(subject).to_not be_valid
    end

    it 'Is not valid with a negative price' do
      subject.price = -1
      expect(subject).to_not be_valid
    end

    it 'Is not valid with a negative quantity' do
      subject.quantity = -1
      expect(subject).to_not be_valid
    end
  end
end
