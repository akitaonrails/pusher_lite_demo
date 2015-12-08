class PusherEvent
  include ActiveModel::Model

  attr_accessor :message
  validates :message, presence: true
end