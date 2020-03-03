require 'spec_helper'

describe 'wls_profile::node' do
  let(:pre_condition) {
    """
      class { 'Wls_profile':
        weblogic_password => Sensitive('Welcome01'),
      }
      class { 'wls_profile::node::copy_domain':
        weblogic_password => Sensitive('Welcome01'),
      }
    """
  }
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile }
    end
  end
end
