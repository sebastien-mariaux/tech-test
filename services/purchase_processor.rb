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
    input['data'].map do |order_data|
      process_order(order_data)
    end
  end

  private

  def process_order(order_data)
    ReceiptGenerator.new(formatted_order(order_data)).call
  end

  def formatted_order(order_data)
    order_data['items'].each_with_object({}) do |item, acc|
      item_object = Item.new(name: item['name'], price: item['price'], imported: item['imported'],
                             tax_exempt: item['tax_exempt'])
      acc[item_object] = item['quantity']
    end
  end
end
