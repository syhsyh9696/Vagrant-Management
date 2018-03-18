class AnnouncementsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]

  def index
    @announcements = Announcement.all
  end

  def show
    @announcement = Announcement.find(params[:id])
  end

  def new
    @announcement = Announcement.new

    redirect_to root_path, alert: "You have no permission" unless current_user.admin?
  end

  def edit

  end

  def create

  end

  def update

  end

  def destroy

  end

  private
    def announcement_params
      params.require(:announcement).permit(:title, :author, :class, :content)
    end
end
