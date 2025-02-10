# frozen_string_literal: true

require_relative '../helpers'

# Accepts of list of items and their quantities and generates a receipt
class ReceiptGenerator
  def initialize(input)
    @input = input
  end

  def call
    content = [items_lines, sales_taxes_line, total_line].join("\n")
    "#{content}\n"
  end

  def total_tax
    @input.sum { |item, quantity| item.tax * quantity }
  end

  def total_amount
    total_amount_before_tax + total_tax
  end

  private

  def items_lines
    @input.map do |item, quantity|
      item_line(item, quantity)
    end
  end

  def item_line(item, quantity)
    "#{quantity} #{item.name}: #{format_price(line_price(item, quantity))}"
  end

  def sales_taxes_line
    "Sales Taxes: #{format_price(total_tax)}"
  end

  def total_line
    "Total: #{format_price(total_amount)}"
  end

  def total_amount_before_tax
    @input.sum { |item, quantity| item.price * quantity }
  end

  def line_price(item, quantity)
    (item.price * quantity) + (item.tax * quantity)
  end
end
