class AttendeeDetailsController < ApplicationController

  def show
  end


  def create
    @conference = Conference.find(params[:conference_id])
    @attendee_detail = @conference.attendee_details.create(params_attendee_detail)
    redirect_to conference_path(@conference)
  end
  def destroy
    @conference = Conference.find(params[:conference_id])
    @attendee_detail = @conference.attendee_details.find(params[:id])
    @attendee_detail.destroy
    redirect_to @conference
  end
end
private
def params_attendee_detail

  params[:attendee_detail].permit(:first_name,:last_name,:city,:state)
end
