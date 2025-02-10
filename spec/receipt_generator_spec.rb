# frozen_string_literal: true

require 'rspec'
require_relative '../models/item'
require_relative '../services/receipt_generator'

# books, food, and medical products that are exempt of tax.

RSpec.describe 'Challenge' do
  context 'example input 1' do
    let(:book) { Item.new(name: 'book', price: 12.49, imported: false, tax_exempt: true) }
    let(:music_cd) { Item.new(name: 'music CD', price: 14.99, imported: false, tax_exempt: false) }
    let(:chocolate_bar) { Item.new(name: 'chocolate bar', price: 0.85, imported: false, tax_exempt: true) }
    let(:input) do
      {
        book => 2,
        music_cd => 1,
        chocolate_bar => 1
      }
    end

    let(:output) do
      <<~TEXT
        2 book: 24.98
        1 music CD: 16.49
        1 chocolate bar: 0.85
        Sales Taxes: 1.50
        Total: 42.32
      TEXT
    end

    it 'returns the correct output' do
      puts ReceiptGenerator.new(input).call
      expect(ReceiptGenerator.new(input).call).to eq(output)
    end

    it 'computes the total tax' do
      generator = ReceiptGenerator.new(input)
      expect(generator.total_tax).to eq(1.50)
    end

    it 'computes the total amount' do
      generator = ReceiptGenerator.new(input)
      expect(generator.total_amount).to eq(42.32)
    end
  end

  context 'example input 2' do
    let(:imported_box_of_chocolates) do
      Item.new(name: 'imported box of chocolates', price: 10.00, imported: true, tax_exempt: true)
    end
    let(:imported_bottle_of_perfume) do
      Item.new(name: 'imported bottle of perfume', price: 47.50, imported: true, tax_exempt: false)
    end
    let(:input) do
      {
        imported_box_of_chocolates => 1,
        imported_bottle_of_perfume => 1
      }
    end

    let(:output) do
      <<~TEXT
        1 imported box of chocolates: 10.50
        1 imported bottle of perfume: 54.65
        Sales Taxes: 7.65
        Total: 65.15
      TEXT
    end

    it 'returns the correct output' do
      expect(ReceiptGenerator.new(input).call).to eq(output)
    end

    it 'computes the total tax' do
      generator = ReceiptGenerator.new(input)
      expect(generator.total_tax).to eq(7.65)
    end

    it 'computes the total amount' do
      generator = ReceiptGenerator.new(input)
      expect(generator.total_amount).to eq(65.15)
    end
  end

  context 'example input 3' do
    let(:imported_bottle_of_perfume) do
      Item.new(name: 'imported bottle of perfume', price: 27.99, imported: true, tax_exempt: false)
    end
    let(:bottle_of_perfume) { Item.new(name: 'bottle of perfume', price: 18.99, imported: false, tax_exempt: false) }
    let(:packet_of_headache_pills) do
      Item.new(name: 'packet of headache pills', price: 9.75, imported: false, tax_exempt: true)
    end
    let(:imported_boxes_of_chocolates) do
      Item.new(name: 'imported boxes of chocolates', price: 11.25, imported: true, tax_exempt: true)
    end
    let(:input) do
      {
        imported_bottle_of_perfume => 1,
        bottle_of_perfume => 1,
        packet_of_headache_pills => 1,
        imported_boxes_of_chocolates => 3
      }
    end

    let(:output) do
      <<~TEXT
        1 imported bottle of perfume: 32.19
        1 bottle of perfume: 20.89
        1 packet of headache pills: 9.75
        3 imported boxes of chocolates: 35.55
        Sales Taxes: 7.90
        Total: 98.38
      TEXT
    end

    it 'returns the correct output' do
      expect(ReceiptGenerator.new(input).call).to eq(output)
    end

    it 'computes the total tax' do
      generator = ReceiptGenerator.new(input)
      expect(generator.total_tax).to eq(7.90)
    end

    it 'computes the total amount' do
      generator = ReceiptGenerator.new(input)
      expect(generator.total_amount).to eq(98.38)
    end
  end
end
