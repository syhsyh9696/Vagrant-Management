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
    @vagrantfile = Vagrantfile.new(vagrantfile_params)

    if current_user.admin?
      @vagrantfile.author = current_user
      if @vagrantfile.save
        redirect_to vagrantfile_path(@vagrantfile)
      else
        render :new
      end
    else
      flash[:danger] = "修改不可"
    end

  end

  private
    def vagrantfile_params
      params.require(:vagrantfile).permit(:filename, :remark, :configure, :system_name, :system_version, :version)
    end


end
