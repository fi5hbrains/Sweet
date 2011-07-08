class LineItem < ActiveRecord::Base
  belongs_to :cart
  belongs_to :product
  belongs_to :order
  
  before_create :ensure_size_selected

private
  def ensure_size_selected
    if size36 > 0 || size38 > 0 || size40 > 0 || size42 > 0 || size44 > 0 || size46 > 0 || size48 > 0 || size50 > 0 || size52 > 0
      return true
    else
      errors.add(:base, 'Выберите, пожалуйста, размер.')
      return false
    end
  end

end

