require 'rails_helper'

RSpec.describe Recipe, type: :model do
subject { Recipe.new(name: 'Kabsah', description: 'The best in the west', cooking_time: 45, preparation_time: 40) } 
  before { subject.save }

  it 'Name should not be empty' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'Description should not be empty' do
    subject.description = nil
    expect(subject).to_not be_valid
  end

  it 'Cooking time should not be empty' do
    subject.cooking_time = nil
    expect(subject).to_not be_valid
  end

  it 'Preperation time should not be empty' do
    subject.preparation_time = nil
    expect(subject).to_not be_valid
  end
end
