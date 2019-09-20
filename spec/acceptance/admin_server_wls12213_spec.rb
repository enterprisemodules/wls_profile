require_relative '../spec_helper_acceptance'

describe 'wls_profile::admin_server' do
  context 'when applying WebLogic 12.2.1.3' do
    it_should_behave_like "a WebLogic installer",
      version: 12213,
      file: 'fmw_12.2.1.3.0_wls.jar'
  end
end
