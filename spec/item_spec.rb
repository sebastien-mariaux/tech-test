# frozen_string_literal: true

require 'rspec'
require_relative '../models/item'

RSpec.describe 'Item' do
  it 'should be initialized with a name, price, imported, and exempt' do
    item = Item.new(name: 'book', price: 12.49, imported: false, tax_exempt: true)
    expect(item.name).to eq('book')
    expect(item.price).to eq(12.49)
    expect(item.imported).to eq(false)
    expect(item.tax_exempt).to eq(true)
  end
end
