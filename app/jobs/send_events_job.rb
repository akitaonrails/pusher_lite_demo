class SendEventsJob < ActiveJob::Base
  queue_as :default

  def perform(event_params)
    @event = PusherEvent.new(event_params)
    # TODO: add Pusher event here
    Rails.logger.debug("Received message: #{@event.message}")
  end
end
