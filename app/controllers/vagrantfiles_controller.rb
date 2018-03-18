class VagrantfilesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]

  def index
    @vagrantfiles = Vagrantfile.all
  end

  def show
    @vagrantfile = Vagrantfile.find(params[:id])
  end

  def new
    @vagrantfile = Vagrantfile.new
    redirect_to root_path, alert: "You have no permission." if !current_user.admin?
  end

  def edit
    @vagrantfile = Vagrantfile.find(params[:id])
    redirect_to root_path, alert: "You have no permission." if !current_user.admin?
  end

  def create
    @vagrantfile = Vagrantfile.new(vagrantfile_params)
    @vagrantfile.author = current_user.author_name

    redirect_to vagrantfiles_path, notice: "Create vagrantfile success."
  end

  def update
    @vagrantfile = Vagrantfile.find(params[:id])
    @vagrantfile.update(vagrantfile_params)
    redirect_to vagrantfiles_path, notice: "Update vagrantfile success."
  end

  def destroy
    @vagrantfile = Vagrantfile.find(params[:id])
    @vagrantfile.destroy

    flash[:alert] = "Vagrantfile deleted"
    redirect_to vagrantfiles_path
  end

  private
    def vagrantfile_params
      params.require(:vagrantfile).permit(:filename, :remark, :configure, :system_name, :system_version, :version)
    end


end
