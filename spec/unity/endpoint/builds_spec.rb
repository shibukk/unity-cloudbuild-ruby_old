require 'spec_helper'

describe Unity::Cloudbuild::Endpoint::Builds do
  include_context 'shared configuration'

  let(:client) { Unity::Cloudbuild::Client.new(api_keys) }
  let(:api_keys) { valid_api_keys }

  def set_all_buildtargetid(api_keys)
    api_keys[:buildtargetid] = '_all'
  end

  def set_valid_number(api_keys)
    build = Unity::Cloudbuild::Client.new(valid_api_keys).get_last_package
    api_keys[:number] = build[0]["build"]
  end

  def set_invalid_number(api_keys)
    api_keys[:number] = 99999999
  end

  def build_and_set_number(api_keys)
    build = Unity::Cloudbuild::Client.new(valid_api_keys).create_new_build
    api_keys[:number] = build[0]["build"]
  end

  describe 'builds#get_all_audit_log', vcr: 'endpoint/builds_get_all_audit_log' do
    subject { client.get_all_audit_log }

    context 'when you success to get all audit log' do
      it { expect{ subject }.not_to raise_error }
      it { expect(subject).not_to be_empty }
    end

    context 'when you failed to get all audit log' do
      let(:api_keys) { invalid_api_keys }
      it { expect{ subject }.to raise_error Unity::Cloudbuild::Error::InvalidSignature }
    end
  end

  describe 'builds#create_polling_jobs', vcr: 'endpoint/builds_create_polling_jobs' do
    subject { client.create_polling_jobs }

    context 'when you success to create polling jobs' do
      it { expect{ subject }.not_to raise_error }
      it { expect(subject).not_to be_empty }
    end

    context 'when you failed to create polling jobs' do
      let(:api_keys) { invalid_api_keys }
      it { expect{ subject }.to raise_error Unity::Cloudbuild::Error::InvalidSignature }
    end

    context 'when you success to create polling all jobs' do
      before { set_all_buildtargetid(valid_api_keys) }
      it { expect{ subject }.not_to raise_error }
      it { expect(subject).not_to be_empty }
    end
  end

  describe 'builds#list_all_builds', vcr: 'endpoint/builds_list_all_builds' do
    subject { client.list_all_builds }

    context 'when you success to list all builds' do
      it { expect{ subject }.not_to raise_error }
      it { expect(subject).not_to be_empty }
    end

    context 'when you failed to list all builds' do
      let(:api_keys) { invalid_api_keys }
      it { expect{ subject }.to raise_error Unity::Cloudbuild::Error::InvalidSignature }
    end

    context 'when you success to list all target builds' do
      before { set_all_buildtargetid(valid_api_keys) }
      it { expect{ subject }.not_to raise_error }
      it { expect(subject).not_to be_empty }
    end
  end

  describe 'builds#create_new_build', vcr: 'endpoint/builds_create_new_build' do
    subject { client.create_new_build }

    context 'when you success to create new build' do
      it { expect{ subject }.not_to raise_error }
      it { expect(subject).not_to be_empty }
    end

    context 'when you failed to create new build' do
      let(:api_keys) { invalid_api_keys }
      it { expect{ subject }.to raise_error Unity::Cloudbuild::Error::InvalidSignature }
    end

    context 'when you success to create all new build' do
      before { set_all_buildtargetid(valid_api_keys) }
      it { expect{ subject }.not_to raise_error }
      it { expect(subject).not_to be_empty }
    end

    context 'when you success to create new build add options' do
      subject { client.create_new_build({}, { clean: true, delay: 30 }) }
      it { expect{ subject }.not_to raise_error }
      it { expect(subject).not_to be_empty }
    end
  end

  describe 'builds#cancel_all_builds', vcr: 'endpoint/builds_cancel_all_builds' do
    subject { client.cancel_all_builds }

    context 'when you success to cancel all builds' do
      it { expect{ subject }.not_to raise_error }
      it { expect(subject).to be_nil }
    end

    context 'when you failed to cancel all builds' do
      let(:api_keys) { invalid_api_keys }
      it { expect{ subject }.to raise_error Unity::Cloudbuild::Error::InvalidSignature }
    end

    context 'when you success to cancel all new build' do
      before { set_all_buildtargetid(valid_api_keys) }
      it { expect{ subject }.not_to raise_error }
      it { expect(subject).to be_nil }
    end
  end

  describe 'builds#build_status', vcr: 'endpoint/builds_build_status' do
    subject { client.build_status }

    context 'when you success to build status' do
      before { set_valid_number(valid_api_keys) }
      it { expect{ subject }.not_to raise_error }
      it { expect(subject).not_to be_empty }
    end

    context 'when you failed to build status' do
      before { set_valid_number(invalid_api_keys) }
      let(:api_keys) { invalid_api_keys }
      it { expect{ subject }.to raise_error Unity::Cloudbuild::Error::InvalidSignature }
    end

    context 'when you not found to build status' do
      before { set_invalid_number(valid_api_keys) }
      it { expect{ subject }.to raise_error Unity::Cloudbuild::Error::NotFound }
    end
  end

  describe 'builds#cancel_build', vcr: 'endpoint/builds_cancel_build' do
    subject { client.cancel_build }

    context 'when you success to cancel build' do
      before { build_and_set_number(valid_api_keys) }
      it { expect{ subject }.not_to raise_error }
      it { expect(subject).to be_nil }
    end

    context 'when you failed to cancel build' do
      before { build_and_set_number(invalid_api_keys) }
      let(:api_keys) { invalid_api_keys }
      it { expect{ subject }.to raise_error Unity::Cloudbuild::Error::InvalidSignature }
    end

    context 'when you not found to cancel build' do
      before { set_invalid_number(valid_api_keys) }
      it { expect{ subject }.to raise_error Unity::Cloudbuild::Error::NotFound }
    end
  end

  describe 'builds#get_audit_log', vcr: 'endpoint/builds_get_audit_log' do
    subject { client.get_audit_log }

    context 'when you success to get audit log' do
      before { set_valid_number(valid_api_keys) }
      it { expect{ subject }.not_to raise_error }
      it { expect(subject).not_to be_empty }
    end

    context 'when you failed to get audit log' do
      before { set_valid_number(invalid_api_keys) }
      let(:api_keys) { invalid_api_keys }
      it { expect{ subject }.to raise_error Unity::Cloudbuild::Error::InvalidSignature }
    end

    context 'when you not found to get audit log' do
      before { set_invalid_number(valid_api_keys) }
      it { expect{ subject }.not_to raise_error }
    end
  end

  describe 'builds#list_all_builds_for_org', vcr: 'endpoint/builds_list_all_builds_for_org' do
    subject { client.list_all_builds_for_org }

    context 'when you success to list all builds for org' do
      it { expect{ subject }.not_to raise_error }
      it { expect(subject).not_to be_empty }
    end

    context 'when you failed to list all builds for org' do
      let(:api_keys) { invalid_api_keys }
      it { expect{ subject }.to raise_error Unity::Cloudbuild::Error::InvalidSignature }
    end
  end

  describe 'builds#cancel_builds_for_org', vcr: 'endpoint/builds_cancel_builds_for_org' do
    subject { client.cancel_builds_for_org }

    context 'when you success to cancel builds for org' do
      before { build_and_set_number(valid_api_keys) }
      it { expect{ subject }.not_to raise_error }
      it { expect(subject).to be_nil }
    end

    context 'when you failed to cancel builds for org' do
      before { build_and_set_number(invalid_api_keys) }
      let(:api_keys) { invalid_api_keys }
      it { expect{ subject }.to raise_error Unity::Cloudbuild::Error::InvalidSignature }
    end

    context 'when you not found to cancel builds for org' do
      before { set_invalid_number(valid_api_keys) }
      it { expect(subject).to be_nil }
    end
  end

  describe 'builds#get_build_log', vcr: 'endpoint/builds_get_build_log' do
    subject { client.get_build_log }

    context 'when you success to get build log' do
      before { set_valid_number(valid_api_keys) }
      it { expect{ subject }.not_to raise_error }
      it { expect(subject).not_to be_empty }
    end

    context 'when you failed to get build log' do
      before { set_valid_number(invalid_api_keys) }
      let(:api_keys) { invalid_api_keys }
      it { expect{ subject }.to raise_error Unity::Cloudbuild::Error::InvalidSignature }
    end

    context 'when you not found to get build log' do
      before { set_invalid_number(valid_api_keys) }
      it { expect{ subject }.to raise_error Unity::Cloudbuild::Error::NotFound }
    end
  end

  describe 'builds#create_a_new_link_to_share_a_project', vcr: 'endpoint/builds_create_a_new_link_to_share_a_project' do
    subject { client.create_a_new_link_to_share_a_project }

    context 'when you success to create a new link to share a project' do
      before { set_valid_number(valid_api_keys) }
      it { expect{ subject }.not_to raise_error }
      it { expect(subject).not_to be_empty }
    end

    context 'when you failed to create a new link to share a project' do
      before { set_valid_number(invalid_api_keys) }
      let(:api_keys) { invalid_api_keys }
      it { expect{ subject }.to raise_error Unity::Cloudbuild::Error::InvalidSignature }
    end

    context 'when you not found to create a new link to share a project' do
      before { set_invalid_number(valid_api_keys) }
      it { expect{ subject }.to raise_error Unity::Cloudbuild::Error::NotFound }
    end
  end

  describe 'builds#get_the_share_link', vcr: 'endpoint/builds_get_the_share_link' do
    subject { client.get_the_share_link }

    context 'when you success to get the share link' do
      before { set_valid_number(valid_api_keys) }
      it { expect{ subject }.not_to raise_error }
      it { expect(subject).not_to be_empty }
    end

    context 'when you failed to get the share link' do
      before { set_valid_number(invalid_api_keys) }
      let(:api_keys) { invalid_api_keys }
      it { expect{ subject }.to raise_error Unity::Cloudbuild::Error::InvalidSignature }
    end

    context 'when you not found to get the share link' do
      before { set_invalid_number(valid_api_keys) }
      it { expect{ subject }.to raise_error Unity::Cloudbuild::Error::NotFound }
    end
  end

  describe 'builds#revoke_a_shared_link', vcr: 'endpoint/builds_revoke_a_shared_link' do
    subject { client.revoke_a_shared_link }

    context 'when you success to revoke a shared link' do
      before { set_valid_number(valid_api_keys) }
      it { expect{ subject }.not_to raise_error }
      it { expect(subject).to be_nil }
    end

    context 'when you failed to revoke a shared link' do
      before { set_valid_number(invalid_api_keys) }
      let(:api_keys) { invalid_api_keys }
      it { expect{ subject }.to raise_error Unity::Cloudbuild::Error::InvalidSignature }
    end

    context 'when you not found to revoke a shared link' do
      before { set_invalid_number(valid_api_keys) }
      it { expect{ subject }.to raise_error Unity::Cloudbuild::Error::NotFound }
    end
  end
end
