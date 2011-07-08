class Order < ActiveRecord::Base
  validates :name, :phone, :presence => true
  has_many :line_items, :dependent => :destroy
  default_scope :order => 'id DESC'

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      line_items << item
      item.cart_id = nil
    end
  end

  def remove
    sizes.each do |size|
      line_items.each do |item|
        if item[:"#{size}"] > 0
          item.product[:"#{size}"] -= item[:"#{size}"]
          item.product.save
        end
      end
    end
  end

  def put_back
    sizes.each do |size|
      line_items.each do |item|
        if item[:"#{size}"] > 0
          item.product[:"#{size}"] += item[:"#{size}"]
          item.product.save
        end
      end
    end
  end

  def sizes
    sizes = Array.new
    (36..52).step(2).each do |i|
      sizes << "size#{i}"
    end
    return sizes
  end

end
