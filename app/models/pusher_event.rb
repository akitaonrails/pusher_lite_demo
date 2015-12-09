require "net/http"
require "uri"
class PusherEvent
  include ActiveModel::Model

  attr_accessor :name, :message
  validates :name, :message, presence: true

  def save
    uri = URI.parse("#{Rails.application.secrets.pusher_url}/events")
    Net::HTTP.post_form(uri, {
      "topic" => Rails.application.secrets.pusher_channel,
      "event" => "msg",
      "payload" => {"name" => name, "message" => message}.to_json
    })
  end

  def save_pusher
    Pusher.trigger(Rails.application.secrets.pusher_channel, 'new_message', {
      name: name,
      message: message
    })
  end
end