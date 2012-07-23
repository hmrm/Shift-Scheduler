class AvailabilitiesController < ApplicationController

  def admin
    @tutors = Tutor.all
    @tutors_legible = Tutor.select('name, hours')
    @availabilities = {}
    @availabilities_legible = Availability.joins(:shift_time).joins(:tutor).select('name, time_of_day, day_of_week, available')
    ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"].each do |day|
      this_day = {}
      ShiftTime.where("day_of_week = '#{day}'").order("time_of_day DESC").each do |time|
        this_time = {}
        Availability.where("shift_time_id = '#{time.id}'").each do |availability|
          this_time[Tutor.find(availability.tutor_id)] = availability.available
        end
        this_day[time] = this_time
      end
      @availabilities[day] = this_day.to_a
    end

    @max_length = @availabilities.values.map{|availabilitys| availabilitys.count}.max

    respond_to do |format|
      format.html
      format.json { render :json => {:availabilities => @availabilities_legible, :tutors => @tutors_legible} }
      format.xml { render :xml => {:availabilities => @availabilities_legible, :tutors => @tutors_legible} }
    end
  end

  #for ajax
  def update
    params["ids"].each do |id|
      Availability.find(id).update_attribute(:available, params['available']);
      respond_to do |format|
        format.html { head :no_content }
        format.json { head :no_content }
      end
    end
  end

end
