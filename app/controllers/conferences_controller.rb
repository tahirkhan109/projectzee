class ConferencesController < ApplicationController
  before_action :authenticate_user!
  def index
  @conferences = Conference.all
  end

  def new
  @conference = Conference.new()
end

  def create
    @conference = Conference.new(conf_params)
    if @conference.save
      flash[:success] = 'Conference Has Been Created Successfully'
      redirect_to @conference
    else
      render 'new'
    end
  end
  def edit
      @conference = Conference.find(params[:id])
    end
def show
  @conference = Conference.find(params[:id])
end
  def destroy

      @conference = Conference.find(params[:id])
      if @conference.delete
        flash[:success] = 'Conference Has Been Deleted Successfully'
        redirect_to conferences_path
      end
    end
  def update
      @conference = Conference.find(params[:id])
      if @conference.update(conf_params)
        flash[:success] = 'Conference Has Been Updated Successfully'
        redirect_to @conference
      else
        render "edit"
      end
    end

  private
  def conf_params
  params[:conference].permit(:title,:location,:start_datetime,:end_datetime)
  end



end
