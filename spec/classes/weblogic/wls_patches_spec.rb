require 'spec_helper'

describe 'wls_profile::weblogic::wls_patches' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:test_facts) {{}}
      let(:facts) { os_facts.merge(test_facts) }

      it { is_expected.to compile.with_all_deps }

      context "no patch windows defined" do
        context "patch level NONE" do
          let(:test_facts) {{
            'wls_install_homes' => {
              '/opt/oracle/middleware12' => {
                'running_domains' => [],
                'installed_patches' => []
              }
            }          
          }}
          let(:params) {{
            'version'      => 12214,
            'level'        => 'NONE',
            'patch_window' => :undef,
          }}
          it { is_expected.to contain_echo('Ensure WebLogic patch level NONE on /opt/oracle/middleware12')}
          
          it { is_expected.to contain_echo('All WebLogic patches already installed. No more patching required.')}
        end

        context "patchlevel specified" do
          let(:params) {{
            'version'      => 12214,
            'level'        => 'JAN2021RU',
            'patch_window' => :undef,
          }}

          context "Domain not running" do
            let(:test_facts) {{
              'wls_install_homes' => {
                '/opt/oracle/middleware12' => {
                  'running_domains' => [],
                  'installed_patches' => []
                }
              }          
            }}
            it { is_expected.to contain_echo('Ensure WebLogic patch level JAN2021RU on /opt/oracle/middleware12')}
            it { is_expected.to contain_echo('Directly applying WebLogic patches because no domains are running from middleware home')}
            it { is_expected.to contain_wls_opatch('/opt/oracle/middleware12:32253037')
              .with('oracle_product_home_dir' => '/opt/oracle/middleware12')
            }
          end

          context "Domain is running" do
            let(:test_facts) {{
              'wls_install_homes' => {
                '/opt/oracle/middleware12' => {
                  'running_domains' => ['dom0'],
                  'installed_patches' => []
                }
              }          
            }}
            it { is_expected.to contain_echo('Ensure WebLogic patch level JAN2021RU on /opt/oracle/middleware12')}
            it { is_expected.to contain_echo('Skipping WebLogic patching because no patch window specified.')}
            it { is_expected.not_to contain_wls_opatch('/opt/oracle/middleware12:32253037')}
          end

          context "wls_install_homes not defined" do
            #
            # This is the initial roll out scenario
            #
            let(:test_facts) {{}}
  
            it { is_expected.to contain_echo('Ensure WebLogic patch level JAN2021RU on /opt/oracle/middleware12')}
            
            it { is_expected.to contain_echo('Directly applying WebLogic patches because no domains are running from middleware home')}
            
            it { is_expected.to contain_wls_opatch('/opt/oracle/middleware12:32253037')
              .with('oracle_product_home_dir' => '/opt/oracle/middleware12')
              .with('patch_id'                => '32253037')
              .with('ensure'                  => 'present')
            }
          end
  
        end

      end

      context "patch window defined" do
        let(:params) {{
          'version'      => 12214,
          'level'        => 'JAN2021RU',
          'patch_window' => '00:00 - 23:59',
        }}

        context "Domain not running" do
          let(:test_facts) {{
            'wls_install_homes' => {
              '/opt/oracle/middleware12' => {
                'running_domains' => [],
                'installed_patches' => []
              }
            }          
          }}

          it { is_expected.to contain_echo('Ensure WebLogic patch level JAN2021RU on /opt/oracle/middleware12')}
          
          it { is_expected.to contain_echo('Directly applying WebLogic patches because no domains are running from middleware home')}
          
          it { is_expected.to contain_wls_opatch('/opt/oracle/middleware12:32253037')
            .with('oracle_product_home_dir' => '/opt/oracle/middleware12')
            .with('patch_id'                => '32253037')
            .with('ensure'                  => 'present')
          }
        end

        context "Domain is running" do
          let(:test_facts) {{
            'wls_install_homes' => {
              '/opt/oracle/middleware12' => {
                'running_domains' => ['dom01'],
                'installed_patches' => []
              }
            }          
          }}

          it { is_expected.to contain_echo('Ensure WebLogic patch level JAN2021RU on /opt/oracle/middleware12')}
          
          it { is_expected.to contain_echo('Ensuring WebLogic patch(es) in patch window: 00:00 - 23:59')}
          
          it { is_expected.to contain_schedule('wls_patch_window')
            .with('range' => '00:00 - 23:59')
          }
          
          it { is_expected.to contain_wls_profile__weblogic__private__stop_domain('dom01')
            .with('schedule_name' => 'wls_patch_window')
          }
          
          it { is_expected.to contain_wls_profile__weblogic__private__start_domain('dom01')
            .with('schedule_name' => 'wls_patch_window')
          }
          
          it { is_expected.to contain_wls_opatch('/opt/oracle/middleware12:32253037')
            .with('oracle_product_home_dir' => '/opt/oracle/middleware12')
            .with('patch_id'                => '32253037')
            .with('ensure'                  => 'present')
            .with('schedule'                => 'wls_patch_window')
            .that_comes_before('Wls_profile::Weblogic::Private::Start_domain[dom01]')
            .that_requires('Wls_profile::Weblogic::Private::Stop_domain[dom01]')
          }
          
          it { is_expected.to contain_echo('Stopping AdminServer, nodemanager and managed servers in domain dom01')
            .with('schedule' => 'wls_patch_window')
          }
          
          it { is_expected.to contain_file('/tmp/stop_managed_servers_for_dom01.py')
            .with('path'     => '/tmp/stop_managed_servers_for_dom01.py')
            .with('ensure'   => 'present')
            .with('schedule' => 'wls_patch_window')
            .that_comes_before('Wls_exec[dom01/@/tmp/stop_managed_servers_for_dom01.py]')
          }
          
          it { is_expected.to contain_wls_exec('dom01/@/tmp/stop_managed_servers_for_dom01.py')
            .with('domain'    => 'dom01')
            .with('statement' => '@/tmp/stop_managed_servers_for_dom01.py')
            .with('schedule'  => 'wls_patch_window')
            .that_comes_before('Exec[cleanup stopscript dom01]')
          }
          
          it { is_expected.to contain_exec('cleanup stopscript dom01')
            .with('command'  => '/bin/rm -f /tmp/stop_managed_servers_for_dom01.py')
            .with('schedule' => 'wls_patch_window')
            .that_comes_before('Exec[Stop nodemanager for dom01]')
          }
          
          it { is_expected.to contain_exec('Stop nodemanager for dom01')
            .with('command'  => '/usr/bin/systemctl stop nodemanager_dom01')
            .with('schedule' => 'wls_patch_window')
          }

          it { is_expected.to contain_wls_daemon('dom01')
            .with('ensure'                  => 'absent')
            .that_requires('Exec[Stop nodemanager for dom01]')
          }

          it { is_expected.to contain_echo('Restarting AdminServer, nodemanager and managed servers in domain dom01')
            .with('schedule' => 'wls_patch_window')
          }
          
          it { is_expected.to contain_exec('Starting nodemanager dom01 after patching')
            .with('command'  => '/usr/bin/systemctl restart nodemanager_dom01')
            .with('schedule' => 'wls_patch_window')
            .that_comes_before('Sleep[Wait for nodemanager on domain dom01]')
          }
          
          it { is_expected.to contain_sleep('Wait for nodemanager on domain dom01')
            .that_comes_before('Wls_install::Control[start_adminserver_dom01_after_patches]')
          }
          
          it { is_expected.to contain_wls_install__control('start_adminserver_dom01_after_patches')
            .with('action'                      => 'start')
            .with('schedule'                    => 'wls_patch_window')
            .that_comes_before('File[/tmp/start_managed_servers_for_dom01.py]')
          }
          
          it { is_expected.to contain_file('/tmp/start_managed_servers_for_dom01.py')
            .with('path'     => '/tmp/start_managed_servers_for_dom01.py')
            .with('ensure'   => 'present')
            .with('schedule' => 'wls_patch_window')
            .that_comes_before('Wls_exec[dom01/@/tmp/start_managed_servers_for_dom01.py]')
          }
          
          it { is_expected.to contain_wls_exec('dom01/@/tmp/start_managed_servers_for_dom01.py')
            .with('domain'    => 'dom01')
            .with('statement' => '@/tmp/start_managed_servers_for_dom01.py')
            .with('schedule'  => 'wls_patch_window')
          }
          
          it { is_expected.to contain_exec('cleanup startscript dom01')
            .with('command'  => '/bin/rm -f /tmp/start_managed_servers_for_dom01.py')
            .with('schedule' => 'wls_patch_window')
          }
          
          it { is_expected.to contain_wls_adminserver('start_adminserver_dom01_after_patches:AdminServer')
            .with('ensure'                      => 'start')
          }
        end
      end
    end
  end
end
