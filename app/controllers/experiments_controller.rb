class ExperimentsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]

  def index
    @experiments = Experiment.all
  end

  def show
    @experiment = Experiment.find(params[:id])
    @judgement = @experiment.judgement
    @followers = @experiment.users.page(params[:page]).per(10)
  end

  def vagrantfile
    @experiment = Experiment.find(params[:experiment_id])
  end
  
  def new
    @experiment = Experiment.new
    redirect_to root_path, alert: "You have no permission." if !current_user.admin?
  end

  def create
    @experiment = Experiment.new(experiment_params)
    @experiment.author = current_user.author_name
    
    if @experiment.save
      redirect_to experiments_path, notice: "Create experiment success."
    else
      render :new
    end
  end

  def update 
    find_experiment_and_check_permission
    if @experiment.update(experiment_params)
      redirect_to experiment_path(@experiment), notice: "Update experiment success."
    else
      render :edit
    end
  end

  def destroy 
    find_experiment_and_check_permission

    @experiment.destroy
    redirect_to experiment_path, alert: "Experiment deleted."
  end

  private
    def experiment_params
      params.require(:experiment).permit(
        :title, :author, :expiration_date)
    end

    def find_experiment_and_check_permission
      @experiment = Experiment.find(params[:id])

      redirect_to root_path, alert: "You have no permission" unless current_user.admin?
    end
end
