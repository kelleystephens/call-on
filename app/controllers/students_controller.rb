class StudentsController < ApplicationController

  def index
    @students = Student.all
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to students_path, notice: "#{@student.name} has been added to the list."
    else
      flash.now[:alert] = "Student could not be added."
      @students = Student.all
      render :index
    end
  end

  def call_on
    student = Student.pick_random
    student.update(called_on: DateTime.now)
    redirect_to students_path, notice: "#{student.name} has been chosen."
  end

  protected

  def student_params
    params.require(:student).permit(:name)
  end
end
