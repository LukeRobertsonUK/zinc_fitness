class Exercise < ActiveRecord::Base
  attr_accessible :description, :name
  has_many :exercise_sets
  has_many :workouts, through: :exercise_sets
  has_many :set_records, through: :exercise_sets
  default_scope order('name' )
  validates :name, presence: true
  validates :name, uniqueness: true
  before_destroy :check_not_in_use


  def check_not_in_use
    unless self.workouts.blank?
      errors.add(:base, "This Exercise cannot be deleted as it is used in existing Workouts")
      return false
    end
  end



end
