class Cart < ActiveRecord::Base
  has_many :line_items, :dependent => :destroy
  
  def add_product(item)
    current_item = line_items.find_by_product_id(item[:product_id])
    if current_item
      sizes.each do |size|
        current_item[:"#{size}"] ||= 0
        item[:"#{size}"] ||= 0
        current_item[:"#{size}"] += item[:"#{size}"].to_i
      end
    else
      current_item = line_items.build(item)
    end    
    current_item
  end
  
  def sizes
    sizes = Array.new
    (36..52).step(2).each do |i|
      sizes << "size#{i}"
    end
    return sizes
  end
  
end
