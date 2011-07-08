module CartsHelper
  def total_price(cart)
    cart.line_items.to_a.sum { |item| item_total_price(item) }
  end
end
