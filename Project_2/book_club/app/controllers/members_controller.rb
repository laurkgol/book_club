class MembersController < ApplicationController
  def index
    @members = Member.all
  end
  def show
    @member = Member.find(params[:id])
    @club = Club.find(@member.club_id)
  end

  def new
    @club = Club.find(params[:club_id])
    @member = @club.members.new
  end

  def create
    @club = Club.find(params[:club_id])
    @club.members.create(member_params)
    redirect_to club_path(@club)
  end

  def edit
    @member = Member.find(params[:id])
    @club = Club.find(params[:club_id])
  end

  def update
    @club = Club.find(params[:club_id])
    @member = Member.find(params[:id])
    @member.update(member_params)
    redirect_to club_member_path(@club, @member)

  end

  def destroy
    @club = Club.find(params[:club_id])
    @member = Member.find(params[:id])
    @member.destroy
    redirect_to club_path(@club)
  end

  private
  def member_params
    params.require(:member).permit(:name, :email, :street_address, :street_address_2, :city, :state, :zip, :photo_url)
  end
end
