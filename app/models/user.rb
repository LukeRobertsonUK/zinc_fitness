class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  default_scope order('last_name' )

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name

  has_many :workouts
  has_many :exercise_sets, through: :workouts
  has_many :set_records, through: :exercise_sets

  def role?(role)
    self.role == role
  end


  def full_name
    "#{first_name} #{last_name}"
  end

  def personal_bests
    grouped_exercises = self.set_records.where('weight > 0').group_by{|record| record.exercise_set.exercise.name}
    grouped_exercises.each do |key, value|
    grouped_exercises[key] = value.map{|record| record.weight}.compact.max
    end
    grouped_exercises.reject! {|key, value| value == nil}
    grouped_exercises#
  end
end
