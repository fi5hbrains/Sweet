module LineItemsHelper
  def item_total_price(item)
    item.product.new_price * quantity(item)
  end
end
