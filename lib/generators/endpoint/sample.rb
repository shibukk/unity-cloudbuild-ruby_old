
def get_audit_log(options={})
  request(:get, build_target_path(options) + "/auditlog")
end

def create_polling_jobs(options={})
  request(:post, build_target_path(options) + "/polling")
end

def list_all_builds(options={})
  request(:get, build_target_path(options) + "/builds")
end

def create_new_build(options={})
  request(:post, build_target_path(options) + "/builds")
end

def cancel_all_builds(options={})
  request(:delete, build_target_path(options) + "/builds")
end

def build_status(options={})
  number = options[:number] || @client.configuration.number
  request(:get, build_target_path(options) + "/builds/#{number}")
end

def cancel_build(options={})
  number = options[:number] || @client.configuration.number
  request(:delete, build_target_path(options) + "/builds/#{number}")
end

def get_audit_log(options={})
  number = options[:number] || @client.configuration.number
  request(:get, build_target_path(options) + "/builds/#{number}/auditlog")
end

def list_all_builds_for_org(options={})
  request(:get, org_path(options) + "/builds")
end

def cancel_builds_for_org(options={})
  request(:delete, org_path(options) + "/builds")
end

def get_build_log(options={})
  number = options[:number] || @client.configuration.number
  request(:get, build_target_path(options) + "/builds/#{number}/log")
end

def get_the_share_link(options={})
  number = options[:number] || @client.configuration.number
  request(:get, build_target_path(options) + "/builds/#{number}/share")
end

def create_a_new_link_to_share_a_project(options={})
  number = options[:number] || @client.configuration.number
  request(:post, build_target_path(options) + "/builds/#{number}/share")
end

def revoke_a_shared_link(options={})
  number = options[:number] || @client.configuration.number
  request(:delete, build_target_path(options) + "/builds/#{number}/share")
end

def list_all_build_targets_for_a_project(options={})
  request(:get, project_path(options) + "/buildtargets")
end

def create_build_target_for_a_project(options={})
  request(:post, project_path(options) + "/buildtargets")
end

def get_a_build_target(options={})
  request(:get, build_target_path(options))
end

def update_build_target_details(options={})
  request(:put, build_target_path(options))
end

def delete_build_target(options={})
  request(:delete, build_target_path(options))
end

def list_all_build_targets_for_an_org(options={})
  request(:get, org_path(options) + "/buildtargets")
end

def list_all_unity_versions(options={})
  request(:get, "/versions/unity")
end

def list_all_xcode_versions(options={})
  request(:get, "/versions/xcode")
end

def get_all_android_credentials(options={})
  request(:get, project_path(options) + "/credentials/signing/android")
end

def upload_android_credentials(options={})
  request(:post, project_path(options) + "/credentials/signing/android")
end

def get_android_credential_details(options={})
  credentialid = options[:credentialid] || @client.configuration.credentialid
  request(:get, project_path(options) + "/credentials/signing/android/#{credentialid}")
end

def update_android_credentials(options={})
  credentialid = options[:credentialid] || @client.configuration.credentialid
  request(:put, project_path(options) + "/credentials/signing/android/#{credentialid}")
end

def delete_android_credentials(options={})
  credentialid = options[:credentialid] || @client.configuration.credentialid
  request(:delete, project_path(options) + "/credentials/signing/android/#{credentialid}")
end

def get_all_ios_credentials(options={})
  request(:get, project_path(options) + "/credentials/signing/ios")
end

def upload_ios_credentials(options={})
  request(:post, project_path(options) + "/credentials/signing/ios")
end

def get_ios_credential_details(options={})
  credentialid = options[:credentialid] || @client.configuration.credentialid
  request(:get, project_path(options) + "/credentials/signing/ios/#{credentialid}")
end

def update_ios_credentials(options={})
  credentialid = options[:credentialid] || @client.configuration.credentialid
  request(:put, project_path(options) + "/credentials/signing/ios/#{credentialid}")
end

def delete_ios_credentials(options={})
  credentialid = options[:credentialid] || @client.configuration.credentialid
  request(:delete, project_path(options) + "/credentials/signing/ios/#{credentialid}")
end

def get_billing_plan(options={})
  request(:get, org_path(options) + "/billingplan")
end

def get_ssh_key(options={})
  request(:get, org_path(options) + "/sshkey")
end

def regenerate_ssh_key(options={})
  request(:post, org_path(options) + "/sshkey")
end

def list_all_projects_(user)(options={})
  request(:get, "/projects")
end

def get_project_details(options={})
  projectupid = options[:projectupid] || @client.configuration.projectupid
  request(:get, "/projects/#{projectupid}")
end

def list_all_projects_(org)(options={})
  request(:get, org_path(options) + "/projects")
end

def create_project(options={})
  request(:post, org_path(options) + "/projects")
end

def get_project_details(options={})
  request(:get, project_path(options))
end

def update_project_details(options={})
  request(:put, project_path(options))
end

def archive_project(options={})
  request(:delete, project_path(options))
end

def get_billing_plan(options={})
  request(:get, project_path(options) + "/billingplan")
end

def get_ssh_key(options={})
  request(:get, project_path(options) + "/sshkey")
end

def get_project_statistics(options={})
  request(:get, project_path(options) + "/stats")
end

def get_audit_log(options={})
  request(:get, project_path(options) + "/auditlog")
end

def list_all_users(options={})
  request(:get, project_path(options) + "/users")
end

def grant_user_access(options={})
  request(:post, project_path(options) + "/users")
end

def revoke_user_access(options={})
  email = options[:email] || @client.configuration.email
  request(:delete, project_path(options) + "/users/#{email}")
end

def get_details_on_shared_build_including_download_link(options={})
  shareid = options[:shareid] || @client.configuration.shareid
  request(:get, "/shares/#{shareid}")
end

def list_ios_device_profiles(options={})
  request(:get, "/users/me/devices")
end

def create_ios_device_profile(options={})
  request(:post, "/users/me/devices")
end

def get_current_user(options={})
  request(:get, "/users/me")
end

def update_current_user(options={})
  request(:put, "/users/me")
end

def regenerate_api_key(options={})
  request(:post, "/users/me/apikey")
end

def list_hooks_for_organization(options={})
  request(:get, org_path(options) + "/hooks")
end

def add_hook_for_organization(options={})
  request(:post, org_path(options) + "/hooks")
end

def get_organization_hook_details(options={})
  id = options[:id] || @client.configuration.id
  request(:get, org_path(options) + "/hooks/#{id}")
end

def delete_organization_hook(options={})
  id = options[:id] || @client.configuration.id
  request(:delete, org_path(options) + "/hooks/#{id}")
end

def update_hook_for_organization(options={})
  id = options[:id] || @client.configuration.id
  request(:put, org_path(options) + "/hooks/#{id}")
end

def ping_an_org_hook(options={})
  id = options[:id] || @client.configuration.id
  request(:post, org_path(options) + "/hooks/#{id}/ping")
end

def list_hooks_for_project(options={})
  request(:get, project_path(options) + "/hooks")
end

def add_hook_for_project(options={})
  request(:post, project_path(options) + "/hooks")
end

def get_project_hook_details(options={})
  id = options[:id] || @client.configuration.id
  request(:get, project_path(options) + "/hooks/#{id}")
end

def delete_project_hook(options={})
  id = options[:id] || @client.configuration.id
  request(:delete, project_path(options) + "/hooks/#{id}")
end

def update_hook_for_project(options={})
  id = options[:id] || @client.configuration.id
  request(:put, project_path(options) + "/hooks/#{id}")
end

def ping_a_project_hook(options={})
  id = options[:id] || @client.configuration.id
  request(:post, project_path(options) + "/hooks/#{id}/ping")
end

