class StudentsController < ApplicationController
  def index
    @students = Student.all
  end

  def create
    student = Student.create(student_params)
    redirect_to students_path
  end

  protected

  def student_params
    params.require(:student).permit(:name)
  end
end
