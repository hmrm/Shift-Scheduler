class Tutor < ActiveRecord::Base
  attr_accessible :name

  has_many :availabilitys, :dependent => :destroy

  validates :name, :uniqueness => true
end
