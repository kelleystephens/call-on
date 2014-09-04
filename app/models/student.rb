class Student < ActiveRecord::Base
  before_create :populate_default_values

  validates_presence_of :name

  default_scope -> { order("called_on ASC NULLS first") }
  scope :not_called_on_today, -> { where("called_on <= ?", DateTime.now.prev_day) }

  def self.pick_random
    students = Student.not_called_on_today
    student = students.sample
  end

  protected

  def populate_default_values
    self.called_on ||= DateTime.new(1, 1, 1)
  end
end
