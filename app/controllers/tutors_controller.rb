class TutorsController < ApplicationController
  # GET /tutors
  # GET /tutors.json
  def index
    @tutors = Tutor.all

    respond_to do |format|
      format.html # index.html.erb
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
