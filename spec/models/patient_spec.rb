require 'rails_helper'

RSpec.describe Patient, :type => :model do
  context 'validations' do
    it { is_expected.to validate_presence_of(:name) }
  end

  context 'model validation' do
    context 'valid attribues' do
      let(:attributes) { { name: 'Otávio' } }

      it { expect(build(:patient, **attributes).valid?).to be_truthy }
    end
    
    context 'invalid attributes' do
      let(:attributes) { { name: nil } }

      it { expect(build(:patient, **attributes).valid?).to be_falsey }
    end
  end
end
