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
  puts "00000000000000000000000000000000",params.inspect
    @attendee_detail = AttendeeDetail.find(params[:id])

    render :partial => "flight_detail_popup",:locals => {:@attendee_detail => @attendee_detail}
  end

  def add_popup_ground
    puts "00000000000000000000000000000000",params.inspect
    @attendee_detail = AttendeeDetail.find(params[:id])
    render :partial => "ground_detail_popup",:locals => {:@attendee_detail => @attendee_detail}
  end
  def create_flight_detail
  aaaaaaaaaaaaaaaaaaaaaaaaaa
  end

  def add_flight_detail
    @flight_det = FlightDetail.where(:attendee_detail_id => params[:id]).first
    puts "000000000000000000000",@flight_det.present?
    if @flight_det.present?
      @flight_detail = @flight_det.update_attributes(:airline_name => params[:airline_name], :flight_number => params[:flight_number], :departuring_from => params[:departure_airport],:departure_time => params[:departure_time],:arriving_at => params[:arrival_airport],:arriving_time => params[:arrival_time],:connections => params[:connections],:attendee_detail_id => params[:id] )
    else
      @flight_detail = FlightDetail.create(:airline_name => params[:airline_name], :flight_number => params[:flight_number], :departuring_from => params[:departure_airport],:departure_time => params[:departure_time],:arriving_at => params[:arrival_airport],:arriving_time => params[:arrival_time],:connections => params[:connections],:attendee_detail_id => params[:id] )
    end
      render :text => "ok"
  end
  #def add_flight_detail
  #  @flight_det = FlightDetail.where(:attendee_detail_id => params[:id]).first
  #  puts "000000000000000000000",@flight_det.present?
  #  if @flight_det.present?
  #    @flight_detail = @flight_det.update_attributes(:airline_name => params[:airline_name], :flight_number => params[:flight_number], :departure_airport => params[:departure_airport],:arrival_airport => params[:arrival_airport],:date => params[:date],:time_of_flight => params[:time_of_flight],:attendee_detail_id => params[:id] )
  #  else
  #    @flight_detail = FlightDetail.create(:airline_name => params[:airline_name], :flight_number => params[:flight_number], :departure_airport => params[:departure_airport],:arrival_airport => params[:arrival_airport],:date => params[:date],:time_of_flight => params[:time_of_flight],:attendee_detail_id => params[:id] )
  #  end
  #    render :text => "ok"
  #end


end
