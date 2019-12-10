class ConferenceroomsController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @conferenceroom = Conferenceroom.new
  end
  
  def create
    facility = Facility.new
    facility.save
    @conferenceroom = Conferenceroom.new(conferenceroom_params)
    @conferenceroom.facility_id = 1
    if @conferenceroom.save!
      flash[:success] = "会議室を登録しました"
      redirect_to root_url
    else
      render 'new'
    end
  end
  
  def index
    @conferenceroom = Conferenceroom.all
  end
  
  def show
    @conferenceroom = Conferenceroom.find_by(id: params[:id])
    @event = Event.all
  end
  
  def edit
    @conferenceroom = Conferenceroom.find_by(id: params[:id])
  end
  
  def update
    @conferenceroom = Conferenceroom.find_by(id: params[:id])
    if @conferenceroom.update_attributes(conferenceroom_params)
      redirect_to :root
    else
      render action: :edit
    end
  end
  
  def destroy
    @conferenceroom = Conferenceroom.find_by(id: params[:id])
    if @conferenceroom.destroy
      flash[:notice] = "会議室が削除されました"
    else
      flash[:alert] = "会議室の削除に失敗しました"
    end
    redirect_to root_path
  end
  
  private
    def conferenceroom_params
      params.require(:conferenceroom).permit(:people, :price, :remarks, :start_date, :end_date, :conferenceroomname)
    end
end
