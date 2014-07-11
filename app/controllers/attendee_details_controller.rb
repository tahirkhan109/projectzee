class AttendeeDetailsController < ApplicationController

  before_filter :check_user, :only => [:attendee_flight_detail, :attendee_ground_detail, :attendee_agenda_detail,:attendee_home]

  def check_user
    @attendee = AttendeeDetail.find_by_id(session[:attendee_id])
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

  def edit_flight_detail
  @flight_detail = FlightDetail.find_by_attendee_detail_id(params[:attendee_id])
   if @flight_detail.present?
   @flight_detail.update_attributes(edit_flight_params)
  redirect_to "/admin/attendee_flight_detail?id=#{params[:attendee_id]}&c_id=#{@flight_detail.attendee_detail.conference.id}"
  else
    @flight_detail = FlightDetail.new(edit_flight_params)
     if @flight_detail.save
       @flight_detail.update_attributes(:attendee_detail_id => params[:attendee_id])
       redirect_to "/admin/attendee_flight_detail?id=#{params[:attendee_id]}&c_id=#{@flight_detail.attendee_detail.conference.id}"
     end
    end
  end
  def edit_ground_detail
    @ground_detail = GroundDetail.find_by_attendee_detail_id(params[:attendee_id])
    if @ground_detail.present?
     @ground_detail.update_attributes(edit_ground_params)
    redirect_to "/admin/attendee_ground_detail?id=#{params[:attendee_id]}&c_id=#{@ground_detail.attendee_detail.conference.id}"
    else
      @ground_detail = GroundDetail.new(edit_ground_params)
      if @ground_detail.save
        @ground_detail.update_attributes(:attendee_detail_id => params[:attendee_id])
      end
      redirect_to "/admin/attendee_ground_detail?id=#{params[:attendee_id]}&c_id=#{@ground_detail.attendee_detail.conference.id}"
      end
  end


  def create
    @conference = Conference.find(params[:conference_id])
    @attendee = AttendeeDetail.where(:first_name => params[:attendee_detail][:first_name], :last_name => params[:attendee_detail][:last_name],:conference_id => params[:conference_id]).first
    if @attendee.blank?
    @attendee_detail = @conference.attendee_details.create(params_attendee_detail)
    flash[:success] = 'Attendee Created Successfully'
    redirect_to conference_path(@conference)
    else
      flash[:error] = 'User With This Name Already Exists'
      redirect_to conference_path(@conference)
      end
  end

  def destroy
    @conference = Conference.find(params[:conference_id])
    @attendee_detail = @conference.attendee_details.find(params[:id])
    @attendee_detail.destroy
    flash[:success] = 'Attendee Deleted Successfully'
    redirect_to @conference
  end

  def display_user_data
    @attendee = AttendeeDetail.where(:first_name => params[:attendee][:firstname].upcase, :last_name => params[:attendee][:lastname].upcase).first
    if @attendee.present?
      session[:attendee_id] = @attendee.id
      redirect_to "/attendee_details/attendee_home?id=#{@attendee.id}"
    else
      flash[:error] = 'No Information Against This User'
      redirect_to "/"
    end
  end
end
private
def params_attendee_detail

  params[:attendee_detail].permit(:first_name, :last_name, :city, :state)
end
def edit_flight_params
  params[:flight_detail].permit(:departuring_from,:airline_name,:flight_number,:departure_time,:record_locator,:arriving_at,:arriving_time,:connections)
end
def edit_ground_params
  params[:ground_detail].permit(:departing_from,:departure_time,:destination,:estimated_transit_time,:instructions)
end