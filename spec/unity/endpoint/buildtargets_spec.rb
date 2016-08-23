require 'spec_helper'

describe Unity::Cloudbuild::Endpoint::Buildtargets do
  include_context 'shared configuration'

  let(:client) { Unity::Cloudbuild::Client.new(api_keys) }
  let(:api_keys) { valid_api_keys }

  def set_all_buildtargetid(api_keys)
    api_keys[:buildtargetid] = '_all'
  end

  describe 'buildtargets#list_all_build_targets_for_a_project', vcr: 'endpoint/buildtargets_list_all_build_targets_for_a_project' do
    subject { client.list_all_build_targets_for_a_project }

    context 'when you success to list all build targets for a project' do
      it { expect{ subject }.not_to raise_error }
      it { expect(subject).not_to be_empty }
    end

    context 'when you failed to list all build targets for a project' do
      let(:api_keys) { invalid_api_keys }
      it { expect{ subject }.to raise_error Unity::Cloudbuild::Error::InvalidSignature }
    end
  end

  describe 'buildtargets#create_build_target_for_a_project', vcr: 'endpoint/buildtargets_create_build_target_for_a_project' do
    subject { client.create_build_target_for_a_project({ buildtargetid: "test-target" }, { name: "test-target", platform: "webplayer", settings: { autoBuild: false, scm: { type: "git", branch: "master" } }, enabled: true }) }

    context 'when you success to create build target for a project' do
      it { expect{ subject }.not_to raise_error }
      it { expect(subject).not_to be_empty }
    end

    context 'when you failed to create build target for a project' do
      let(:api_keys) { invalid_api_keys }
      it { expect{ subject }.to raise_error Unity::Cloudbuild::Error::InvalidSignature }
    end
  end

  describe 'buildtargets#get_a_build_target', vcr: 'endpoint/buildtargets_get_a_build_target' do
    subject { client.get_a_build_target }

    context 'when you success to get a build target' do
      it { expect{ subject }.not_to raise_error }
      it { expect(subject).not_to be_empty }
    end

    context 'when you failed to get a build target' do
      let(:api_keys) { invalid_api_keys }
      it { expect{ subject }.to raise_error Unity::Cloudbuild::Error::InvalidSignature }
    end
  end

  describe 'buildtargets#update_build_target_details', vcr: 'endpoint/buildtargets_update_build_target_details' do
    subject { client.update_build_target_details({ buildtargetid: "test-target" }, { name: "test-target2", enabled: false }) }

    context 'when you success to update build target details' do
      it { expect{ subject }.not_to raise_error }
      it { expect(subject).not_to be_empty }
    end

    context 'when you failed to update build target details' do
      let(:api_keys) { invalid_api_keys }
      it { expect{ subject }.to raise_error Unity::Cloudbuild::Error::InvalidSignature }
    end
  end

  describe 'buildtargets#delete_build_target', vcr: 'endpoint/buildtargets_delete_build_target' do
    subject { client.delete_build_target({ buildtargetid: "test-target2" }) }

    context 'when you success to delete build target' do
      it { expect{ subject }.not_to raise_error }
      it { expect(subject).to be_nil }
    end

    context 'when you failed to delete build target' do
      let(:api_keys) { invalid_api_keys }
      it { expect{ subject }.to raise_error Unity::Cloudbuild::Error::InvalidSignature }
    end
  end

  describe 'buildtargets#list_all_build_targets_for_an_org', vcr: 'endpoint/buildtargets_list_all_build_targets_for_an_org' do
    subject { client.list_all_build_targets_for_an_org }

    context 'when you success to list all build targets for an org' do
      it { expect{ subject }.not_to raise_error }
      it { expect(subject).not_to be_empty }
    end

    context 'when you failed to list all build targets for an org' do
      let(:api_keys) { invalid_api_keys }
      it { expect{ subject }.to raise_error Unity::Cloudbuild::Error::InvalidSignature }
    end
  end
end
