class Availability < ActiveRecord::Base
  attr_accessible :available, :tutor_id, :shift_time_id
  belongs_to :tutor
  belongs_to :shift_time
end
