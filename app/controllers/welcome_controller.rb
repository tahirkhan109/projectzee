class WelcomeController < ApplicationController
  #before_action :authenticate_user!
  def index
    #if current_user && current_user.super_admin?
    #redirect_to :controller => "super_admin" , :action => "new"
    #elsif current_user && current_user.conference_admin?
    #redirect_to :controller => "admin" , :action => "new"
    #end
  end

  def add_popup_flight
    @attendee_detail = AttendeeDetail.find(params[:id])
    render :partial => "flight_detail_popup",:locals => {:@attendee_detail => @attendee_detail}
  end

  def add_popup_ground
    @attendee_detail = AttendeeDetail.find(params[:id])
    render :partial => "ground_detail_popup",:locals => {:@attendee_detail => @attendee_detail}
  end

  def add_popup_agenda
    @attendee_detail = AttendeeDetail.find(params[:id])
    render :partial => "agenda_details_popup",:locals => {:@attendee_detail => @attendee_detail}
  end

  def add_flight_detail
    @flight_det = FlightDetail.where(:attendee_detail_id => params[:id]).first
    if @flight_det.present?
      @flight_detail = @flight_det.update_attributes(:airline_name => params[:airline_name], :flight_number => params[:flight_number], :departuring_from => params[:departure_airport],:departure_time => params[:departure_time],:arriving_at => params[:arrival_airport],:arriving_time => params[:arrival_time],:connections => params[:connections],:attendee_detail_id => params[:id])
    else
      @flight_detail = FlightDetail.create(:airline_name => params[:airline_name], :flight_number => params[:flight_number], :departuring_from => params[:departure_airport],:departure_time => params[:departure_time],:arriving_at => params[:arrival_airport],:arriving_time => params[:arrival_time],:connections => params[:connections],:attendee_detail_id => params[:id])
    end
      render :text => "ok"
  end
  def add_ground_detail
    @ground_det = GroundDetail.where(:attendee_detail_id => params[:id]).first
    if @ground_det.present?
      @ground_detail = @ground_det.update_attributes(:departing_from => params[:departing_from], :departure_time => params[:departure_time], :destination => params[:destination],:estimated_transit_time => params[:estimated_transit_time],:instructions => params[:instructions],:attendee_detail_id => params[:id])
    else
      @ground_detail = GroundDetail.create(:departing_from => params[:departing_from], :departure_time => params[:departure_time], :destination => params[:destination],:estimated_transit_time => params[:estimated_transit_time],:instructions => params[:instructions],:attendee_detail_id => params[:id])
    end
      render :text => "ok"
  end
  def add_agenda_detail
    puts "000000000000000000000000000000000",params.inspect
    if params[:agenda_detail].present?
    @agenda_detail = AgendaDetail.where(:attendee_detail_id => params[:attendee_id]).first
    puts "111111111111111111111111111111111",@agenda_detail.present?

    if @agenda_detail.present?
      puts "iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii"
      @agenda_detail.update_attributes(pic_params)
      render :text => "ok"
    else
      puts "eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee"
      @agenda_detail = AgendaDetail.new(pic_params)
      @agenda_detail.save
      @agenda_detail.update_attributes(:attendee_detail_id => params[:attendee_id])
        render :text => "ok"

      end
    else
      render :text => "not"
      end

    #aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa



    #@ground_det = GroundDetail.where(:attendee_detail_id => params[:id]).first
    #if @ground_det.present?
    #  @ground_detail = @ground_det.update_attributes(:departing_from => params[:departing_from], :departure_time => params[:departure_time], :destination => params[:destination],:estimated_transit_time => params[:estimated_transit_time],:instructions => params[:instructions],:attendee_detail_id => params[:id])
    #else
    #  @ground_detail = GroundDetail.create(:departing_from => params[:departing_from], :departure_time => params[:departure_time], :destination => params[:destination],:estimated_transit_time => params[:estimated_transit_time],:instructions => params[:instructions],:attendee_detail_id => params[:id])
    #end
    #  render :text => "ok"
  end
  private
  def pic_params
    params[:agenda_detail].permit(:attach)# (:pic_file_name,:pic_content_type,:pic_file_size)
  end

end
