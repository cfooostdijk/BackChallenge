class JsonWebToken
  JWT_SECRET = ENV["JWT_SECRET"]
  def self.encode(payload, exp = 8.hours.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, JWT_SECRET)
  end
  def self.decode(token)
    body = JWT.decode(token, JWT_SECRET)[0]
    HashWithIndifferentAccess.new body
  rescue JWT::ExpiredSignature, JWT::VerificationError => e
    raise HandlerExceptions::ExpiredToken, e.message
  rescue JWT::DecodeError, JWT::VerificationError => e
    raise HandlerExceptions::InvalidToken, e.message
  end
end