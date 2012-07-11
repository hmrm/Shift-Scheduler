class ShiftTimesController < ApplicationController
  # GET /shift_times
  # GET /shift_times.json
  def index
    @shift_times = ShiftTime.all
    @times_by_day = {}
    ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"].each do |day|
      @times_by_day[day] = ShiftTime.order("time_of_day DESC").where("day_of_week = '#{day}'")
    end

    @max_length = @times_by_day.values.map{|times| times.length}.max

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @shift_times }
    end
  end

  # GET /shift_times/1
  # GET /shift_times/1.json
  def show
    @shift_time = ShiftTime.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @shift_time }
    end
  end

  # GET /shift_times/new
  # GET /shift_times/new.json
  def new
    @shift_time = ShiftTime.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @shift_time }
    end
  end

  # GET /shift_times/1/edit
  def edit
    @shift_time = ShiftTime.find(params[:id])
  end

  # POST /shift_times
  # POST /shift_times.json
  def create
    @shift_time = ShiftTime.new(params[:shift_time])

    respond_to do |format|
      if @shift_time.save
        format.html { redirect_to @shift_time, notice: 'Shift time was successfully created.' }
        format.json { render json: @shift_time, status: :created, location: @shift_time }
      else
        format.html { render action: "new" }
        format.json { render json: @shift_time.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /shift_times/1
  # PUT /shift_times/1.json
  def update
    @shift_time = ShiftTime.find(params[:id])

    respond_to do |format|
      if @shift_time.update_attributes(params[:shift_time])
        format.html { redirect_to @shift_time, notice: 'Shift time was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @shift_time.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shift_times/1
  # DELETE /shift_times/1.json
  def destroy
    @shift_time = ShiftTime.find(params[:id])
    @shift_time.destroy

    respond_to do |format|
      format.html { redirect_to shift_times_url }
      format.json { head :no_content }
    end
  end
end
