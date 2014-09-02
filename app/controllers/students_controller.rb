class StudentsController < ApplicationController
  def index
    @students = Student.all
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to students_path
    else
      flash.now[:alert] = "Student could not be added."
      @students = Student.all
      render :index
    end
  end

  protected

  def student_params
    params.require(:student).permit(:name)
  end
end

# Time.now, strift time
