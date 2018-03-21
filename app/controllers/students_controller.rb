class StudentsController < ApplicationController
  before_action :authenticate_user!, only: [:show, :new, :create, :update, :edit, :destroy]

  def show
    find_student_infomation
  end

  def new
    @student = Student.new
  end

  def update
    find_student_infomation

    if @student.update(student_params)
      redirect_to user_path(current_user), notice: "Update student infomation success."
    else
      render :edit
    end
  end

  def create
    @student = Student.new(student_params)

    if @student.save
      current_user.student = @student
      redirect_to user_path(current_user), notice: "Create student infomation success"
    else
      render :new
    end
  end

  def destroy
    find_student_infomation

    @student.destroy
    current_user.student = nil
    redirect_to user_path(current_user), notice: "Delete student infomation success"
  end

  def edit
    find_student_infomation
  end

  private
    def student_params
      params.require(:student).permit(
        :stu_name, :stu_number
      )
    end

    def find_student_infomation
      if current_user.student == nil
        redirect_to user_path(current_user), alert: "You don't have student infomation yet."
      else
        @student = current_user.student
      end
    end
end
