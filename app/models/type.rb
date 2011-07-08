class Type < ActiveRecord::Base

  has_many :products, :dependent => :destroy
  validates :section, :presence => true
  validates :section, :uniqueness => true

end
