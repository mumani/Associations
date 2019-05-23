class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      flash[:success] = "Event Created Successfully"
      redirect_to root_url
    else
      render 'new'
    end
  end

  def index
    @events = Event.all
    @past = Event.past
    @future = Event.upcoming
  end

  def show
    @event = Event.find(params[:id])
  end

  private

    def event_params
      params.require(:event).permit(:name, :description, :event_date)
    end
end
