# frozen_string_literal: true

class Item
  attr_reader :name, :price, :imported, :tax_exempt

  def initialize(name:, price:, imported:, tax_exempt:)
    @name = name
    @price = price
    @imported = imported
    @tax_exempt = tax_exempt
  end

  def tax
    total_tax = sales_tax + import_tax
    (total_tax * 20).ceil / 20.0 # that is assuming the rounding is made at the unit level
  end

  private

  def sales_tax
    return 0 if tax_exempt

    (price * 0.1)
  end

  def import_tax
    return 0 unless imported

    (price * 0.05)
  end
end
