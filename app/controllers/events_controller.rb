class EventsController < ApplicationController
  def new
    @event = Event.new
  end
  
  def create
    @event = Event.new(event_params)
    @event.conferenceroom_id = params[:conferenceroom_id]
    @event.user_id = current_user.id
    if @event.save
      flash[:success] = "予約を新規作成しました"
      redirect_to root_url
    else 
      render 'new'
    end
  end
  
  def show
    @event = Event.find(params[:id])
  end
  
  def edit
    @event = Event.find_by(id: params[:id])
  end
  
  def index
    if user_signed_in?
      @event = Event.where(user_id: current_user)
    end
  end
  
  def update
    @event = Event.find_by(id: params[:id])
    if @event.update_attributes(event_params)
      redirect_to :root
    else
      render action: :edit
    end
  end
  
  def destroy
    @event = Event.find_by(id: params[:id])
    if @event.destroy
      flash[:notice] = "予約が削除されました"
    else
      flash[:alert] = "予約の削除に失敗しました"
    end
    redirect_to root_path
  end
  
  private
    def event_params
      params.require(:event).permit(:start_date, :end_date, :title, :content).merge(user_id: current_user.id)
    end
end
