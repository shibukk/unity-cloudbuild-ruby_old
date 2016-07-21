module Unity
  module Cloudbuild
    module Error
      class Base < StandardError
        def initialize(msg,error=nil)
          super(msg)
        end
      end

      class MissingAPIKeys < Base
        def initialize(msg = "You're missing an API key", error=nil)
          super
        end
      end

      class NotFound            < Base; end
      class InternalServerError < Base; end
      class InvalidSignature    < Base; end
    end
  end
end
