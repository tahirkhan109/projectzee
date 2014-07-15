class WelcomeController < ApplicationController
  #before_action :authenticate_user!
  require 'csv'

  def index
    unless current_user.blank?
      if current_user.admin?
        redirect_to "/admin/index?id=#{session[:id]}"
      elsif current_user.programmer?
        redirect_to "/conferences"
      elsif current_user.attendee?
        redirect_to "/conferences"
      end
    end

    #if current_user && current_user.super_admin?
    #redirect_to :controller => "super_admin" , :action => "new"
    #elsif current_user && current_user.conference_admin?
    #redirect_to :controller => "admin" , :action => "new"
    #end
  end


  def add_popup_flight
    @attendee_detail = AttendeeDetail.find(params[:id])
    render :partial => "flight_detail_popup", :locals => {:@attendee_detail => @attendee_detail}
  end

  def add_popup_ground
    @attendee_detail = AttendeeDetail.find(params[:id])
    render :partial => "ground_detail_popup", :locals => {:@attendee_detail => @attendee_detail}
  end

  def add_popup_agenda
    @conference = Conference.find(params[:id])
    render :partial => "agenda_details_popup", :locals => {:@conference => @conference}
  end

  def add_flight_detail
    @flight_det = FlightDetail.where(:attendee_detail_id => params[:id]).first
    if @flight_det.present?
      @flight_detail = @flight_det.update_attributes(:airline_name => params[:airline_name], :flight_number => params[:flight_number], :departuring_from => params[:departure_airport], :departure_time => params[:departure_time], :arriving_at => params[:arrival_airport], :arriving_time => params[:arrival_time], :connections => params[:connections], :attendee_detail_id => params[:id], :record_locator => params[:record_locator])
    else
      @flight_detail = FlightDetail.create(:airline_name => params[:airline_name], :flight_number => params[:flight_number], :departuring_from => params[:departure_airport], :departure_time => params[:departure_time], :arriving_at => params[:arrival_airport], :arriving_time => params[:arrival_time], :connections => params[:connections], :attendee_detail_id => params[:id], :record_locator => params[:record_locator])
    end
    render :text => "ok"
  end

  def add_ground_detail
    @ground_det = GroundDetail.where(:attendee_detail_id => params[:id]).first
    if @ground_det.present?
      @ground_detail = @ground_det.update_attributes(:departing_from => params[:departing_from], :departure_time => params[:departure_time], :destination => params[:destination], :estimated_transit_time => params[:estimated_transit_time], :instructions => params[:instructions], :attendee_detail_id => params[:id])
    else
      @ground_detail = GroundDetail.create(:departing_from => params[:departing_from], :departure_time => params[:departure_time], :destination => params[:destination], :estimated_transit_time => params[:estimated_transit_time], :instructions => params[:instructions], :attendee_detail_id => params[:id])
    end
    render :text => "ok"
  end

  def add_agenda_detail
    puts "00000000000000000000000000000000000000",params.inspect
    if params[:agenda_detail].present?
      @agenda_detail = AgendaDetail.where(:conference_id => params[:conference_id]).first
      if @agenda_detail.present?
        @agenda_detail.update_attributes(pic_params)
        #attendee = AttendeeDetail.where(:id => @agenda_detail.attendee_detail_id).first
        @conference = Conference.find(params[:conference_id])
        flash[:success] = 'Your Uploaded File Has Been Updated SuccessFully. . .'
        redirect_to @conference
      else
        @agenda_detail = AgendaDetail.new(pic_params)
        if @agenda_detail.save
          @agenda_detail.update_attributes(:conference_id => params[:conference_id])
          #attendee = AttendeeDetail.where(:id => @agenda_detail.attendee_detail_id).first
          @conference = Conference.find(params[:conference_id])
          flash[:success] = 'Your File Has Been Uploaded SuccessFully. . .'
          redirect_to @conference
        end
      end
    else
      flash[:error] = 'Trying To Upload Invalid File Formate'
      redirect_to conferences_path
      #render :text => "Invalid Formate"
    end
  end

  def add_csv_popup
    puts "000000000000000000000000000", params.inspect
    @conference = Conference.find(params[:id])

    render :partial => "csv_popup", :locals => {:@conference => @conference}

  end


  def add_boarding_detail
    @attendee = AttendeeDetail.find(params[:id])
    if @attendee.present?
      @attendee.update_attributes(:is_boarding => 1)
      render :text => "ok"
    else
      render :text => "Not Ok"
    end
  end

  def del_boarding_detail
    @attendee = AttendeeDetail.find(params[:id])
    if @attendee.present?
      @attendee.update_attributes(:is_boarding => 0)
      render :text => "ok"
    else
      render :text => "Not Ok"
    end
  end


  def add_csv_data
    puts "000000000000000000000000000", params.inspect
    @conference = Conference.find(params[:conference_id])

    file = AgendaDetail.new(pic_params)
    puts "............................  .....", file.inspect
    insert = []
    CSV.foreach(params[:csv_parse][:attach].path, headers: true) do |row, index|
      #if (row["first_name"].present? &&  row["last_name"].present?)
      if check_duplicate(params[:conference_id], row["first_name"], row["last_name"])
        @attendee = AttendeeDetail.new(:first_name => row["first_name"], :last_name => row["last_name"], :city => row["city"], :state => row["state"], :conference_id => params[:conference_id])
        if @attendee.save
          @flight_detail = FlightDetail.create(:airline_name => row["airline_name"], :flight_number => row["flight_number"], :departuring_from => row["departing_from"], :departure_time => row["departure_time"], :arriving_at => row["arriving_at"], :arriving_time => row["arriving_time"], :connections => row["connections"], :record_locator => row["record_locator"], :attendee_detail_id => @attendee.id)
          @ground_detail = GroundDetail.create(:departing_from => row["departing_from"], :departure_time => row["departure_time"], :destination => row["destination"], :estimated_transit_time => row["estimated_transit_time"], :instructions => row["instructions"], :attendee_detail_id => @attendee.id)
        end
        puts "//////////////////", row.inspect
        puts "//////////////////", row["user_id"]
        puts "//////////////////", row["first_name"]
        puts "//////////////////", row["last_name"]
        puts "//////////////////", row["city"]
        puts "//////////////////", row["state"]
        puts "//////////////////", row["airline_name"]
        puts "//////////////////", row["flight_number"]
        puts "//////////////////", row["record_locator"]
        puts "//////////////////", row["departing_from"]
        puts "//////////////////", row["departure_time"]
        puts "//////////////////", row["arriving_at"]
        puts "//////////////////", row["arriving_time"]
        puts "//////////////////", row["connections"]
        puts "//////////////////", row["departing_from"]
        puts "//////////////////", row["departure_time"]
        puts "//////////////////", row["destination"]
        puts "//////////////////", row["estimated_transit_time"]
        puts "//////////////////", row["instructions"]
        flash[:success] = 'Your File Has Been Uploaded SuccessFully. . .'
        redirect_to @conference
        #end
      else
        puts "00000000000000000000000000000000000000000", row
        insert << row
        puts "***************************************", insert.inspect
        flash[:error] = 'Error Import Csv'
        redirect_to @conference

      end
    end

  end

  private
  def pic_params
    params[:agenda_detail].permit(:attach) # (:pic_file_name,:pic_content_type,:pic_file_size)
  end
  def csv_params
    params[:csv_parse].permit(:attach) # (:pic_file_name,:pic_content_type,:pic_file_size)
  end

  def check_duplicate(id, first_name, last_name)

    if first_name.present? && last_name.present?
      attendee = AttendeeDetail.where(:conference_id => id, :first_name => first_name, :last_name => last_name).first

      return true if attendee.blank?
      return false if attendee.present?
    else
      return false
    end
  end


end
