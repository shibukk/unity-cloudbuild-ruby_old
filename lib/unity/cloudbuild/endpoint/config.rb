module Unity
  module Cloudbuild
    module Endpoint
      class Config < Base
        def list_all_unity_versions(params={})
          path = "/versions/unity"
          request(:get, path)
        end

        def list_all_xcode_versions(params={})
          path = "/versions/xcode"
          request(:get, path)
        end
      end
    end
  end
end
