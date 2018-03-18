class VagrantfilesController < ApplicationController
  def index
    @vagrantfiles = Vagrantfile.all
  end

  def show
    @vagrantfile = Vagrantfile.find(params[:id])
  end

  def new
    @vagrantfile = Vagrantfile.new
  end

  def create
    @vagrantfile = Vagrantfile.new
  end
end
