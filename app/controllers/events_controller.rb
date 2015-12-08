class EventsController < ApplicationController
  def create
    @event = PusherEvent.new(event_params)
    # TODO: add Pusher event here
    Rails.logger.debug("Received message: #{@event.message}")
  end

  def event_params
    params.require(:pusher_event).permit(:message)
  end
end
