class AttendancesController < ApplicationController
  def create
      @event = Event.find(params[:format])
      current_user.event_attendance << @event
      redirect_to @event
  end

  def new
  end
end
