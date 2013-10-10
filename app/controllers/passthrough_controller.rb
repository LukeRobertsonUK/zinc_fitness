class PassthroughController < ApplicationController
  def index
    path = case current_user.role
      when 'admin'
        workouts_path
      else
        user_path(current_user)
    end

    redirect_to path
  end
end