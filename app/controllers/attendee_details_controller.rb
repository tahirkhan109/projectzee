class AttendeeDetailsController < ApplicationController

  #before_filter :check_user, :only => [:attendee_flight_detail, :attendee_ground_detail, :attendee_agenda_detail,:attendee_home]

  def check_user
    @attendee = AttendeeDetail.find_by_id(session[:attendee_id])
    puts "33333333333333333333333333333333",@attendee.id
    puts "44444444444444444444444444444444",params[:id]

    puts "CCC", @attendee.id, params[:id].to_i
    if @attendee.id == params[:id].to_i

    else
      redirect_to "/"
    end
  end

  def show
  end

  def attendee_home

  end

  def attendee_flight_detail

  end

  def attendee_ground_detail

  end

  def attendee_agenda_detail

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

  def display_user_data
    puts "000000000000000000000000000000000",params.inspect
    puts "000000000000000000000000000000000",params[:attendee][:firstname].upcase
    puts "000000000000000000000000000000000",params[:attendee][:lastname].upcase
    @attendee = AttendeeDetail.where(:first_name => params[:attendee][:firstname].upcase, :last_name => params[:attendee][:lastname].upcase).first
    puts "111111111111111111111111111111111",@attendee.inspect
    if @attendee.present?
      session[:attendee_id] = @attendee.id
      redirect_to "/attendee_details/attendee_home?id=#{@attendee.id}"
    else
      flash[:error] = 'No Information Against This User'
      redirect_to "/"
    end
    puts "222222222222222222222222222222222",session[:attendee_id].inspect
  end
end
private
def params_attendee_detail

  params[:attendee_detail].permit(:first_name, :last_name, :city, :state)
end
