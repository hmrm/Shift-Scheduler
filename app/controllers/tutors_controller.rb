class TutorsController < ApplicationController
  def show
    @tutor = Tutor.find(params[:id])
    tutor_availabilitys = Availability.where("tutor_id = #{@tutor.id}").joins(:shift_time).select('availabilities.id, time_of_day, day_of_week, available')
    @availabilitys_by_day = {}
    ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"].each do |day|
      @availabilitys_by_day[day] = tutor_availabilitys.where("day_of_week = '#{day}'").order("time_of_day DESC")
    end

    @max_length = @availabilitys_by_day.values.map{|availabilitys| availabilitys.count}.max

    respond_to do |format|
      format.html
    end
  end

  # GET /tutors
  # GET /tutors.json
  def index
    @tutors = Tutor.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def edit
    @tutor = Tutor.find(params[:id])
  end
    
  def update
    @tutor = Tutor.find(params[id])
    
    respond_to do |format|
      if Tutors.find(params[:id]).update_attributes(params[:tutor])
        format.html { redirect_to @tutor, notice: 'Preference for number of hours updated' }
      else
        format.html {render action: "edit" }
      end
    end
  end
  # GET /tutors/new
  # GET /tutors/new.json
  def new
    @tutor = Tutor.new
    
    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # POST /tutors
  # POST /tutors.json
  def create
    @tutor = Tutor.new(params[:tutor])

    respond_to do |format|
      if @tutor.save
        ShiftTime.all.each do |time|
          Availability.new(:available => :pref, :tutor_id => @tutor.id, :shift_time_id => time.id).save
        end
        format.html { redirect_to tutors_url, notice: 'Tutor was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # DELETE /tutors/1
  # DELETE /tutors/1.json
  def destroy
    @tutor = Tutor.find(params[:id])
    @tutor.destroy

    respond_to do |format|
      format.html { redirect_to tutors_url }
    end
  end
end
