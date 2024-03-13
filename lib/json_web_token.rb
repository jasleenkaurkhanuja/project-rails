class JsonWebToken 
    SECRET_KEY = Rails.application.secret_key_base

    def self.encode(payload, exp = 24.hours.from_now)
        payload[:exp] = exp.to_i 
        JWT.encode(payload, SECRET_KEY)
    end

    def self.decode(token)
        return nil unless token.present?
        begin
        decoded = JWT.decode(token, SECRET_KEY, true, algorithm: 'HS256')[0]
        HashWithIndifferentAccess.new decoded 
    rescue JWT::DecodeError => e
        Rails.logger.error "JWT Decode Error: #{e.message}"
        nil
    end
end
end