module ApplicationHelper
  def number_to_rubles(number)
    number_to_currency(number, :unit => "p.", :separator => ",", :delimiter => "", :format => "%n %u")
  end

  def quantity(product)
    quantity = 0
    sizes.each do |size|
      quantity += product[:"#{size}"] unless product[:"#{size}"] <= 0 
    end
    return quantity
  end
  
  def hidden_div_if(condition, attributes = {}, &block)
    if condition
      attributes['style'] = 'display:none'
    end
    content_tag('div', attributes, &block)
  end

  def tag_style_if(tag, attributes, condition, &block)
    if condition
      style = attributes
    end
    content_tag(tag, style, &block)
  end
end
