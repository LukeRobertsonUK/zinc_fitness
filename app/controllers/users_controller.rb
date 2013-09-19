class UsersController < ApplicationController
  load_and_authorize_resource
  def index
    @users = User.all


    respond_to do |format|
      format.html
      format.js {}
    end
  end

  def show
    @user = User.find(params[:id])
    @completed_workouts = @user.workouts.where(completed: true).order('completion_date DESC').page(params[:page])
    @outstanding_workouts = @user.workouts.where(completion_date: nil).order('due_date').page params[:page_2]
    @grouped_exercises = @user.exercise_sets.where(weight_required: true).group_by{|set| set.exercise.name}
    @grouped_exercises.each do |key, value|
      @grouped_exercises[key] = value.map{|set| set.achieved_weight}.compact.max
    end

    respond_to do |format|
      format.html # show.html.haml

    end
  end



end