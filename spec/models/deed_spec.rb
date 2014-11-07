require 'rails_helper'

describe Deed do
  context 'validations' do
    it 'saves deed when person & action are filled' do
      deed = Deed.new
      expect(deed.save).to be(false)
      deed.person = 'Person'
      expect(deed.save).to be(false)
      deed.action = 'Action'
      expect(deed.save).to be(true)
    end
  end

  context 'callbacks' do
    let(:too_long_string) { '-' * 1001 }
    it 'truncates too long action description (to 1000 characters)' do
      deed = Deed.new(person: 'Person', action: too_long_string)
      deed.save

      expect(deed.reload.action.length).to eq(1000)
    end
  end
end
