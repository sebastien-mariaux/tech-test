# frozen_string_literal: true

require 'json'
require_relative '../models/item'
require_relative '../services/receipt_generator'

# Accepts a file path to a JSON file containing purchase data and returns an array of receipts
class PurchaseProcessor
  def initialize(file_path)
    @file_path = file_path
  end

  def call
    input = JSON.parse(File.read(@file_path))
    input['data'].map do |shopping_basket|
      process_basket(shopping_basket)
    end
  end

  private

  def process_basket(shopping_basket)
    ReceiptGenerator.new(formatted_order(shopping_basket)).call
  end

  def formatted_order(shopping_basket)
    shopping_basket['items'].each_with_object({}) do |item, acc|
      basket_item = Item.new(name: item['name'], price: item['price'], imported: item['imported'],
                             tax_exempt: item['tax_exempt'])
      acc[basket_item] = item['quantity']
    end
  end
end
