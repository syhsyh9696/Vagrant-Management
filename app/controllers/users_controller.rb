class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @submissions = @user.submissions.page(params[:page]).per(10)
    @first_experiment = @user.experiments.order(id: :asc).first
  end
end
