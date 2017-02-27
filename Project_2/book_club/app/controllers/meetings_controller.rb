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
    @club.meetings.create(meeting_params)
    redirect_to club_path(@club)
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
    @meeting.update(meeting_params)
    redirect_to club_meeting_path(@meeting)
  end

  def destroy
    @meeting = Meeting.find(params[:id])
    @club = Club.find(@meeting.club_id)

    @meeting.destroy

    redirect_to club_path(@club)
  end

private

def meeting_params
  params.require(:meeting).permit(:date, :member_id)
end

end
