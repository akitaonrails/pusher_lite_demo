class SendEventsJob < ActiveJob::Base
  queue_as :default

  def perform(event_params)
    @event = PusherEvent.new(event_params)
    @event.save
  end
end
