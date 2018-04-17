class RelationshipsController < ApplicationController
  before_action :authenticate_user!

  def follow_experiment
    @experiment = Experiment.find(params[:experiment_id])
    current_user.follow_experiment(@experiment.id)
    respond_to do |format|
      format.html { redirect_to @experiment }
      format.js
    end
  end

  def unfollow_experiment
    @experiment = Experiment.find(params[:experiment_id])
    current_user.unfollow_experiment(@experiment.id)
    respond_to do |format|
      format.html { redirect_to @experiment }
      format.js
    end
  end
  
end
