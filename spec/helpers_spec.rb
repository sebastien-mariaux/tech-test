require_relative '../helpers'
require 'rspec'

RSpec.describe 'Helpers' do
  it 'formats the price with many decimal' do
    expect(format_price(12.491239480)).to eq('12.49')
  end

  it 'formats the price with one decimal' do
    expect(format_price(12.4)).to eq('12.40')
  end


end