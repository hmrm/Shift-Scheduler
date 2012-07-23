class Tutor < ActiveRecord::Base
  attr_accessible :name, :hours

  has_many :availabilitys, :dependent => :destroy

  validates :name, :uniqueness => true, :length => { :minimum => 2 }
  validates :hours, :numericality => { :less_than_or_equal_to => 19.5, :greater_than_or_equal_to => 0 }
end
