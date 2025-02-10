class Item
  attr_reader :name, :price, :imported, :tax_exempt
  def initialize(name, price, imported, tax_exempt)
    @name = name
    @price = price
    @imported = imported
    @tax_exempt = tax_exempt
  end
end
