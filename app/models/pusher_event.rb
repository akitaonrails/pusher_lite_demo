require "net/http"
require "uri"
class PusherEvent
  include ActiveModel::Model

  attr_accessor :name, :message, :broadcast
  validates :name, :message, presence: true

  def save
    topic = if broadcast == "1"
      "#general"
    else
      Rails.application.secrets.pusher_channel
    end

    Net::HTTP.post_form(PusherLite.uri, {
      "topic" => topic,
      "event" => "msg",
      "scope" => "public",
      "payload" => {"name" => name, "message" => message}.to_json
    })
  end
end