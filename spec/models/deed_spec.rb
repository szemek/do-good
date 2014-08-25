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
end
