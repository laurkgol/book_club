class ClubsController < ApplicationController
  def index
    @clubs = Club.all
  end
  def show
    @club = Club.find(params[:id])
  end
  def new
    @club = Club.new
  end

  def create
    @club = Club.create(club_params.merge(user: current_user))
    redirect_to root_path
  end

  def edit
    @club = Club.find(params[:id])
  end

  def update
    @club = Club.find(params[:id])
    if @club.user == current_user
        @club.update(club_params)
    else
      # Nice job checking user permissions for editing and flash for notifications
      flash[:alert] = "Only the creater can edit"
    end

    redirect_to club_path(@club)
  end

  def destroy
    @club = Club.find(params[:id])
    if @club.user == current_user
    @club.destroy
  else
    flash[:alert] = "Only the owner of this club can delete"
  end
    @club.destroy

    redirect_to root_path
  end

  private
  def club_params
    params.require(:club).permit(:name, :start_date, :end_date)
  end
end
