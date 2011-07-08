class Photo < ActiveRecord::Base
  belongs_to :product
  has_attached_file :photo, :styles => { :thumb => "100x100>", :catalogue => "320x320>", :full => "720x720>" }, :dependent => :destroy

end
