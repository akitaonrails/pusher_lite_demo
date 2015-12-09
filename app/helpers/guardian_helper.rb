module GuardianHelper
  ISSUER = "pl-web-#{Rails.env}"
  DIGEST = OpenSSL::Digest.new('sha256')

  def guardian_token_tags
    token = Base64.urlsafe_encode64(SecureRandom.random_bytes(32))
    [
      "<meta content=\"#{jwt(token)}\" name=\"guardian-csrf\" />",
      "<meta content=\"#{token}\" name=\"guardian-token\" />",
    ].shuffle.join.html_safe
  end

  private

  def jwt(token)
    JWT.encode(jwt_claims(token), Rails.application.secrets.pusher_key, 'HS256')
  end

  def jwt_claims(token)
    {
      aud: :csrf,
      sub: jwt_sub,
      iss: ISSUER,
      iat: Time.now.utc.to_i,
      exp: (Time.now + 30.days).utc.to_i,
      s_csrf: guardian_signed_token(token),
      listen: jwt_listens,
      publish: jwt_publish,
    }
  end

  def jwt_sub
    return {} unless current_human.present?
    {
      id: current_human.id,
      name: current_human.full_name,
      email: current_human.email,
      crews: current_human.crews.map(&:identifier),
    }
  end

  def jwt_listens
    listens = ['deploys:web', 'public:*']
    listens.push('private:*') if current_human.try(:in_crew?, :admins)
    listens
  end

  def jwt_publish
    publish = ['public:*']
    publish.push('private:*') if current_human.try(:in_crew?, :admins)
    publish
  end

  def guardian_signed_token(token)
    key = Rails.application.secrets.pusher_key
    signed_token = OpenSSL::HMAC.digest(DIGEST, key, token)
    Base64.urlsafe_encode64(signed_token).gsub(/={1,}$/, '')
  end
end