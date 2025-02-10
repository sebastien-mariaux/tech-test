# frozen_string_literal: true

require 'rspec'
require_relative '../../models/item'

RSpec.describe 'Item' do
  it 'should be initialized with a name, price, imported, and exempt' do
    item = Item.new(name: 'book', price: 12.49, imported: false, tax_exempt: true)
    expect(item.name).to eq('book')
    expect(item.price).to eq(12.49)
    expect(item.imported).to eq(false)
    expect(item.tax_exempt).to eq(true)
  end

  context 'with an item not imported and tax exempt' do
    let(:item) { Item.new(name: 'book', price: 12.49, imported: false, tax_exempt: true) }

    it 'returns 0 tax' do
      expect(item.tax).to eq(0)
    end
  end

  context 'with an item imported and tax exempt' do
    let(:item) { Item.new(name: 'book', price: 12.49, imported: true, tax_exempt: true) }

    let(:expected_tax) { 0.65 }

    it 'applies 5% tax' do
      expect(item.tax).to eq(expected_tax)
    end
  end

  context 'with an item not imported and not tax exempt' do
    let(:item) { Item.new(name: 'music cd', price: 14.99, imported: false, tax_exempt: false) }

    let(:expected_tax) { 1.50 }

    it 'applies 10% tax' do
      expect(item.tax).to eq(expected_tax)
    end
  end

  context 'with an item imported and not tax exempt' do
    let(:item) { Item.new(name: 'imported bottle of perfume', price: 47.50, imported: true, tax_exempt: false) }

    let(:expected_tax) { 7.15 }

    it 'applies 15% tax' do
      expect(item.tax).to eq(expected_tax)
    end
  end
end
