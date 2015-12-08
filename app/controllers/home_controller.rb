class HomeController < ApplicationController
  def index
    @event = PusherEvent.new
  end
end
