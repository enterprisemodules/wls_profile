require_relative '../spec_helper_acceptance'

describe 'wls_profile::admin_server' do
  context 'when applying WebLogic 14.1.1.0.0' do
    it_should_behave_like "a WebLogic installer",
      version: 14110,
      file: 'fmw_14.1.1.0.0_wls.jar',
      hiera: {
        'wls_profile::java_version'      => '8u241',
        'wls_profile::java_full_version' => 'jdk1.8.0_241',
        'wls_profile::jdk_home'          => '/usr/java/jdk1.8.0_241'
      }
  end
end
