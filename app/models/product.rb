class Product < ActiveRecord::Base
  belongs_to :type
  has_many :photos, :dependent => :destroy
  has_many :line_items
  has_many :orders, :through => :line_items
  before_destroy :ensure_not_referenced_by_any_line_item
  
  validates :article, :new_price, :presence => true
  validates :article, :uniqueness => true
  validates :new_price, :numericality => {:greater_than_or_equal_to => 0.01}

  default_scope :order => 'created_at desc'
  named_scope :of_type, lambda { |type| {:conditions => { :type_id => type } } }
  named_scope :search, lambda { |search| ( where ( search.map{|attr| "#{attr} > 0" }.join( " OR " )))}
    
  def self.filter(sizes,type)
    if sizes.count > 0
      self.of_type(type).search(sizes)
    else
      self.of_type(type)
    end
  end
  
  private
  
    def ensure_not_referenced_by_any_line_item
      if line_items.count.zero?
        return true
      else
        errors.add(:base, 'Этот товар заказан')
        return false
      end
    end
  
end
