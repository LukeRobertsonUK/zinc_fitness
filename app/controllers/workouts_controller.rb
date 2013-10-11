class WorkoutsController < ApplicationController
  load_and_authorize_resource

  # GET /workouts
  # GET /workouts.json
  def index
    @q = Workout.where('user_id > 0').order('created_at DESC' ).search(params[:q])
    @workouts = @q.result(distinct: true).page(params[:page_2])

    @r = Workout.where(user_id: nil).order('created_at DESC' ).search(params[:q])
    @templates = @r.result(distinct: true).page(params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @workouts }
    end
  end

  # GET /workouts/1
  # GET /workouts/1.json
  def show
    @workout = Workout.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @workout }
    end
  end

  # GET /workouts/new
  # GET /workouts/new.json
  def new
    @workout = Workout.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @workout }
    end
  end

  # GET /workouts/1/edit
  def edit
    @workout = Workout.find(params[:id])
    @editing = true
  end

  # POST /workouts
  # POST /workouts.json
  def create
    @workout = Workout.new(params[:workout])

    respond_to do |format|
      if @workout.save
        format.html { redirect_to @workout, notice: 'Workout was successfully created.' }
        format.json { render json: @workout, status: :created, location: @workout }
      else
        format.html { render action: "new" }
        format.json { render json: @workout.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /workouts/1
  # PUT /workouts/1.json
  def update
    @workout = Workout.find(params[:id])

    @workout.mark_completed if (params[:workout][:completed].to_i == 1)
    @workout.mark_uncompleted if (params[:workout][:completed].to_i == 0)
    respond_to do |format|
      if @workout.update_attributes(params[:workout])
        format.html { redirect_to @workout, notice: 'Workout was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @workout.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /workouts/1
  # DELETE /workouts/1.json
  def destroy
    @workout = Workout.find(params[:id])
    @workout.destroy

    respond_to do |format|
      format.html { redirect_to workouts_url }
      format.json { head :no_content }
    end
  end

  def complete
    @workout = Workout.find(params[:id])
  end



  def duplicate
    @workout = Workout.find(params[:id])
    @duplicate = @workout.amoeba_dup
    @duplicate.exercise_sets.each do |set|
      set.suggested_weight = nil
      set.achieved_weight = nil
      set.notes = nil

    end
    @duplicate.save!

    redirect_to workouts_path
  end


end
