module PusherLite
  def self.uri
    key    = Rails.application.secrets.pusher_key
    secret = Rails.application.secrets.pusher_secret
    app_id = Rails.application.secrets.pusher_app_id
    url    = Rails.application.secrets.pusher_url

    uri = "http://#{key}:#{secret}@#{url}/api/apps/#{app_id}/events"
    URI.parse(uri)
  end
end
