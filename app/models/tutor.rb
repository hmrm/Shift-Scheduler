class Tutor < ActiveRecord::Base
  attr_accessible :name, :hours

  has_many :availabilitys, :dependent => :destroy

  validates :name, :uniqueness => true, :length => { :minimum => 2 }
end
