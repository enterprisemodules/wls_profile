require 'spec_helper'

describe 'wls_profile::admin_server::wls_jms' do

  let(:pre_condition) { "wls_setting {'MYDOMAIN':}" }

  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile }
    end
  end
end
