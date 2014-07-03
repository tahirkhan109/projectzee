class ConferencesController < ApplicationController
  def index
  @conferences = Conference.all
  end

  def new
  @conference = Conference.new()
end

  def create
    puts "00000000000000000000",params.inspect
    @conference = Conference.new(conf_params)
    if @conference.save
      redirect_to @conference
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
       redirect_to conferences_path
      end
     #aaaaaaaaaaaaaaaaa
    end
  def update
      @conference = Conference.find(params[:id])
      if @conference.update(conf_params)
        redirect_to @conference
      else
        render "edit"
      end
      #aaaaaaaaaaaaaaaaaaa
    end

  private
  def conf_params
  params[:conference].permit(:title,:location,:start_datetime,:end_datetime)
  end



end
