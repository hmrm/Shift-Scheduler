class ShiftTime < ActiveRecord::Base
  attr_accessible :day_of_week, :time_of_day

  has_many :availabilitys, :dependent => :destroy
end