class MeetingsController < ApplicationController
  def index
    @meetings = Meeting.all

  end
  def new
      @club = Club.find(params[:club_id])
      @meeting = @club.meetings.new
  end

  def create
    @club = Club.find(params[:club_id])
    @meeting = @club.meetings.create!(meeting_params.merge(user: current_user))
    redirect_to club_meeting_path(@club, @meeting)
  end

  def show
    @meeting = Meeting.find(params[:id])
    @club = Club.find(@meeting.club_id)
end

  def edit
    @meeting = Meeting.find(params[:id])
    @club = Club.find(params[:club_id])
  end

  def update
    @meeting = Meeting.find(params[:id])
    if @meeting.user == current_user
        @meeting.update(meeting_params)
    else
      flash[:alert] = "Only the creater can edit"
    end

    redirect_to club_meeting_path(@meeting)
  end

  def destroy
    @meeting = Meeting.find(params[:id])
    @club = Club.find(@meeting.club_id)

    if @meeting.user == current_user
    @meeting.destroy
  else
    flash[:alert] = "Only creater delete"
  end
    redirect_to club_path(@club)
  end

private

def meeting_params
  params.require(:meeting).permit(:date, :host, :location)
end

end
