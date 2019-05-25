class EventsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:create, :new, :show]

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
    #@event = Event.find(params[:id])
  end

  def attend
    @event = Event.find(params[:format])
    current_user.event_attendance << @event
    redirect_to :action => "show", :id => @event.id
  end

  private

    def set_post
      @event = Event.find(params[:id])
      event = @event
    end

    def event_params
      params.require(:event).permit(:name, :description, :event_date)
    end
end
