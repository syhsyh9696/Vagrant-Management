class ExperimentsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]

  def index
    @experiments = Experiment.all.page(params[:page]).per(10)
  end

  def show
    @experiment = Experiment.find(params[:id])
    @judgement = @experiment.judgement
    @followers = @experiment.users.page(params[:page]).per(10)
  end

  def serverfile
    @experiment = Experiment.find(params[:id])
  end

  def serverfile_content
    @content = Experiment.find(params[:id]).generate_vagrantfile_for_followers
  end

  def serverfile_download
    @experiment = Experiment.find(params[:id])
    # @path = "#{Rails.root}/public/experiments/experiment_#{@experiment.id}_vagrantserverfile.rb"
    # @file = File.open(@path, "w")
    # @file << @experiment.generate_vagrantfile_for_followers
    # @file.close
    # system("ruby-beautify -c 2 -s --overwrite #{@path}")
    
    # send_file(@path, filename: "experiment_#{@experiment.id}_vagrantserverfile.rb", stream: false)
    send_data(@experiment.generate_vagrantfile_for_followers,
              filename: "experiment_#{@experiment.id}_vagrantserverfile.rb")
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

  def edit
    find_experiment_and_check_permission
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
