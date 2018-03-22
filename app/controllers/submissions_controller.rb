class SubmissionsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:destroy]

  def index
    @submissions = current_user.submissions
  end

  def show
    @submission = Submission.find(params[:id])
  end

  def new
    @submission = current_user.submissions.build
  end

  def create
    @submission = current_user.submissions.build(submission_params)

    if @submission.save
      redirect_to user_path(current_user), notice: "Create submission success"
    else
      render :new
    end
  end

  def destroy
    @submission.destroy
    redirect_to user_path(current_user), notice: "Delete submission success"
  end


  private
    def submission_params
      params.require(:submission).permit(
        :status, :content
      )
    end

    def correct_user
      @submission = current_user.submissions.find_by(id: params[:id])
      redirect_to user_path(current_user) if @submission = nil
    end

end
