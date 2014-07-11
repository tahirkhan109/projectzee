class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    @conference = Conference.find_by_title(params[:conference_title].upcase)
    if user_signed_in?
      if current_user.admin?
        if @conference.present?
        "/admin/index?id=#{@conference.id}"
        else
          flash.discard
          flash[:success] = 'Conference Does Not Exists'
          session.clear
          end

      elsif current_user.programmer?
              "/conferences"
            end
    else
  root_path
    end
  end
end
