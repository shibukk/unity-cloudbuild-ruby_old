module Unity
  module Cloudbuild
    module Endpoint
      class Simple < Base
        def build(params={})
          request(:post, build_target_path(params) + "/builds")
        end

        def cancel(params={})
          request(:delete, build_target_path(params) + "/builds")
        end

        def download_urls(params={})
          result = request(:get, build_target_path(params) + "/builds?buildStatus=success&per_page=1&page=1")
          return result[0]["links"]["download_primary"]["href"] rescue nil
        end
      end
    end
  end
end
