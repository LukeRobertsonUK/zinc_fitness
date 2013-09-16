class UsersController < ApplicationController

  def index
    @users = User.all


    respond_to do |format|
      format.html
      format.js {}
    end
  end

  def show
    @user = User.find(params[:id])
    @completed_workouts = @user.workouts.where(completed: true).order('completion_date DESC')
    @outstanding_workouts = @user.workouts.where(completed: !true).order('due_date')
    @grouped_exercises = @user.exercise_sets.where(weight_required: true).group_by{|set| set.exercise.name}
    @grouped_exercises.each do |key, value|
      @grouped_exercises[key] = value.map{|set| set.achieved_weight}.compact.max
    end

    respond_to do |format|
      format.html # show.html.haml

    end
  end



end