require "net/http"
require "uri"
class PusherEvent
  include ActiveModel::Model

  attr_accessor :name, :message
  validates :name, :message, presence: true

  def save
    uri = URI.parse("http://localhost:4000/events")
    Net::HTTP.post_form(uri, {"name" => name, "message" => message})
  end

  def save_pusher
    Pusher.trigger(Rails.application.secrets.pusher_channel, 'new_message', {
      name: name,
      message: message
    })
  end
end