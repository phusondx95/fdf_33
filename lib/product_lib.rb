module ProductLib

  def sold_units_of_product order
    order.line_items.each do |item|
      sold_units = item.product.sold_units
      sold_units += item.quantity
      item.product.update_attribute :sold_units, sold_units
    end
  end
end
