module Unity
  module Cloudbuild
    module Endpoint
      class Credentials < Base
        def get_all_android_credentials(params={})
          request(:get, project_path(params) + "/credentials/signing/android")
        end

        def upload_android_credentials(params={})
          request(:post, project_path(params) + "/credentials/signing/android")
        end

        def get_android_credential_details(params={})
          credentialid = params[:credentialid] || @client.configuration.credentialid
          request(:get, project_path(params) + "/credentials/signing/android/#{credentialid}")
        end

        def update_android_credentials(params={})
          credentialid = params[:credentialid] || @client.configuration.credentialid
          request(:put, project_path(params) + "/credentials/signing/android/#{credentialid}")
        end

        def delete_android_credentials(params={})
          credentialid = params[:credentialid] || @client.configuration.credentialid
          request(:delete, project_path(params) + "/credentials/signing/android/#{credentialid}")
        end

        def get_all_ios_credentials(params={})
          request(:get, project_path(params) + "/credentials/signing/ios")
        end

        def upload_ios_credentials(params={})
          request(:post, project_path(params) + "/credentials/signing/ios")
        end

        def get_ios_credential_details(params={})
          credentialid = params[:credentialid] || @client.configuration.credentialid
          request(:get, project_path(params) + "/credentials/signing/ios/#{credentialid}")
        end

        def update_ios_credentials(params={})
          credentialid = params[:credentialid] || @client.configuration.credentialid
          request(:put, project_path(params) + "/credentials/signing/ios/#{credentialid}")
        end

        def delete_ios_credentials(params={})
          credentialid = params[:credentialid] || @client.configuration.credentialid
          request(:delete, project_path(params) + "/credentials/signing/ios/#{credentialid}")
        end
      end
    end
  end
end
