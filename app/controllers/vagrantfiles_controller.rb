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
    find_vagrantfile_and_check_permission
  end

  def create
    @vagrantfile = Vagrantfile.new(vagrantfile_params)
    @vagrantfile.author = current_user.author_name

    redirect_to vagrantfiles_path, notice: "Create vagrantfile success."
  end

  def update
    find_vagrantfile_and_check_permission
    if @vagrantfile.update(vagrantfile_params)
      redirect_to vagrantfile_path(@vagrantfile), notice: "Update vagrantfile success."
    else
      render :edit
    end
  end

  def destroy
    find_vagrantfile_and_check_permission

    @vagrantfile.destroy
    redirect_to vagrantfiles_path, alert: "Vagrantfile deleted"
  end

  private
    def vagrantfile_params
      params.require(:vagrantfile).permit(:filename, :remark, :configure, :system_name, :system_version, :version)
    end

    def find_vagrantfile_and_check_permission
      @vagrantfile = Vagrantfile.find(params[:id])

      redirect_to root_path, alert: "You have no permission" unless current_user.admin?
    end

end
