class EventsController < ApplicationController
  def create
    SendEventsJob.perform_later(event_params)
  end

  def event_params
    params.require(:pusher_event).permit(:name, :message, :broadcast)
  end
end
