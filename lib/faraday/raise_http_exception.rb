require "faraday"
require "json"

module FaradayMiddleware
  class RaiseHttpException < Faraday::Response::Middleware
    def on_complete(env)
      case env[:status].to_i
      when 200..204
        return env.body
      when 401
        raise Unity::Cloudbuild::Error::InvalidSignature, error_message(env)
      when 404
        raise Unity::Cloudbuild::Error::NotFound, error_message(env)
      else
        raise Unity::Cloudbuild::Error::InternalServerError, error_message(env)
      end
    end

    def error_message(env)
      "#{env[:method].to_s.upcase} #{env[:url].to_s}: #{env[:status]}#{error_body(env[:body])}"
    end

    def error_body(body)
      if not body.nil? and not body.empty? and body.kind_of?(String)
        body = JSON.parse(body) rescue body
      end

      if body.nil?
        nil
      elsif body['error'] and not body['error'].empty?
        ": #{body['error']}"
      else
        ": #{body}"
      end
    end
  end
end

Faraday::Response.register_middleware raise_http_exception: FaradayMiddleware::RaiseHttpException
