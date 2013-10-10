class Ability
  include CanCan::Ability




  def initialize(user)
    user ||=User.new
    if user.role? "admin"
        can :manage, :all
    else

        can :create, User
        can :edit, User do |u|
          u.id == user.id
        end
        can :show, User do |u|
            u.id == user.id
        end
        can :update, User do |u|
          u.id == user.id
        end
        can :destroy, User do |u|
          u.id == user.id
        end

        can :read, Exercise

        can :show, Workout do |w|
          w.user_id == user.id
        end

        can :complete, Workout do |w|
            w.user_id == user.id
        end

        can :update, Workout do |w|
            w.user_id == user.id
        end


    end
  end
end
