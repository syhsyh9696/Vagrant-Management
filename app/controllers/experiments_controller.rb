class ExperimentsController < ApplicationController
  def index
    @experiments = Experiment.all
  end

  def show
    @experiment = Experiment.find(params[:id])
    @judgement = @experiment.judgement
  end

  def vagrantfile
    @experiment = Experiment.find(params[:experiment_id])
  end
  

end
