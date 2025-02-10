# frozen_string_literal: true

class ReceiptGenerator
  def initialize(input)
    @input = input
  end

  def call
   content =  @input.map do |item, quantity|
      "#{quantity} #{item.name}: #{line_price(item, quantity)}"
    end
    content << "Sales Taxes: #{total_tax}"
    content << "Total: #{total_amount}"
    content.join("\n")
  end

  def total_tax
    @input.sum { |item, quantity| item.tax * quantity }
  end

  def total_amount
    total_amount_before_tax + total_tax
  end

  private

  def total_amount_before_tax
    @input.sum { |item, quantity| item.price * quantity }
  end

  def line_price(item, quantity)
    item.price * quantity + item.tax * quantity
  end

end
