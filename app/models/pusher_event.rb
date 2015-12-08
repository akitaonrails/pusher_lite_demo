class PusherEvent
  include ActiveModel::Model

  attr_accessor :name, :message
  validates :name, :message, presence: true

  def save
    Pusher.trigger(Rails.application.secrets.pusher_channel, 'new_message', {
      name: name,
      message: message
    })
  end
end