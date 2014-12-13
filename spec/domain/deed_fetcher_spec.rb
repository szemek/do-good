require 'rails_helper'

describe DeedFetcher do
  before do
    30.times { Deed.create(person: 'Anonymous', action: 'unknown') }
  end

  it 'returns 25 deeds for first page' do
    fetcher = DeedFetcher.new(page: 1, created_at: 0)
    expect(fetcher.all.count).to eq(25)
  end

  it 'returns 5 deeds for second page' do
    fetcher = DeedFetcher.new(page: 2, created_at: 0)
    expect(fetcher.all.count).to eq(5)
  end
end
