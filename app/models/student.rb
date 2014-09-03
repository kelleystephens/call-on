class Student < ActiveRecord::Base
  validates_presence_of :name

  default_scope -> { order("id ASC") }
  scope :not_called_on_today, -> { where("called_on <= ?", DateTime.now.prev_day) }

  def self.pick_random
    students = Student.not_called_on_today
    students.sample
  end
end
