# frozen_string_literal: true

class ReceiptGenerator
  def initialize(input)
    @input = input
  end

  def call; end

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
end
