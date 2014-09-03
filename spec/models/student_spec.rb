require 'rails_helper'

RSpec.describe Student, :type => :model do
  before do
    @student_1 = Fabricate(:student, name: "Adam", called_on: DateTime.new(2014, 8, 29))
    Fabricate(:student, name: "John", called_on: DateTime.new(2014, 9, 1))
    @student_3 = Fabricate(:student, name: "Kelley", called_on: DateTime.new(2014, 8, 27))
    Fabricate(:student, name: "Sarah", called_on: DateTime.now)
  end
  it { should validate_presence_of :name }

  it "can return the first valid choice" do
    Array.any_instance.stub(:sample) do |array|
      array[0]
    end
    expect(Student.pick_random).to eq @student_1
  end

  it "can return the last valid choice" do
    Array.any_instance.stub(:sample) do |array|
      array.last
    end
    expect(Student.pick_random).to eq @student_3
  end

end
