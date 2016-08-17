module Unity
  module Cloudbuild
    module Endpoint
      class Config < Base
        def list_all_unity_versions(options={})
          request(:get, "/versions/unity")
        end

        def list_all_xcode_versions(options={})
          request(:get, "/versions/xcode")
        end
      end
    end
  end
end
