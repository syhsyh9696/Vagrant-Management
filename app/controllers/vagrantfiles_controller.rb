class VagrantfilesController < ApplicationController
  def index
    @vagrantfiles = Vagrantfile.all
  end

  def show
    @vagrantfile = Vagrantfile.find(params[:id])
  end


end
