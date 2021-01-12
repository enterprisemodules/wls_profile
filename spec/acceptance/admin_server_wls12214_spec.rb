require_relative '../spec_helper_acceptance'

describe 'wls_profile::admin_server' do
  context 'when applying WebLogic 12.2.1.4' do
    it_should_behave_like "a WebLogic installer",
      version: 12214,
      file: 'fmw_12.2.1.4.0_wls.jar',
      hiera: {
        'wls_profile::java_version'      => '8u241',
        'wls_profile::java_full_version' => 'jdk1.8.0_241',
        'wls_profile::jdk_home'          => '/usr/java/jdk1.8.0_241'
      }
  end
end
