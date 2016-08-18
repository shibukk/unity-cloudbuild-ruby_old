module Unity
  module Cloudbuild
    module Endpoint
      class Simple < Base
        def build(options={})
          request(:post, build_target_path(options) + "/builds")
        end

        def cancel(options={})
          request(:delete, build_target_path(options) + "/builds")
        end

        def download_urls(options={})
          result = request(:get, build_target_path(options) + "/builds?buildStatus=success&per_page=1&page=1")
          return result[0]["links"]["download_primary"]["href"] rescue nil
        end
      end
    end
  end
end
