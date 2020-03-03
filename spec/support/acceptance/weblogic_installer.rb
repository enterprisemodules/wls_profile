shared_examples "a WebLogic installer" do | settings|
  version = settings.fetch(:version)
  file    = settings.fetch(:file)
  before do
    hiera_values_on_sut(
      'easy_type::generate_password_mode' => 'development'
    )
  end
  after(:all) do
    # Cleanup all
    run_shell('killall -u oracle -w || true')
    run_shell('rm -rf /opt/oracle /etc/wls* /etc/oraInst.loc|| true')
  end

  manifest = <<-MANIFEST
    class {wls_profile:
      source => '/software',
    }
    class {wls_profile::weblogic:
      sysctl => 'skip',
    }

    contain wls_profile::admin_server
MANIFEST

  it 'installs the WebLogic software' do
    apply_manifest(manifest, expect_changes: true)
  end

  describe file('/opt/oracle/middleware12/oracle_common') do
    it { should be_directory }
    it { should be_owned_by('oracle') }
    it { should be_grouped_into('dba') }
    it { should be_mode(750) }
  end

  describe file('/opt/oracle/middleware12/wlserver') do
    it { should be_directory }
    it { should be_owned_by('oracle') }
    it { should be_grouped_into('dba') }
    it { should be_mode(750) }
  end

  describe file('/opt/oracle/middleware12/oraInst.loc') do
    it { should be_file }
    it { should be_owned_by('oracle') }
    it { should be_grouped_into('dba') }
    it { should be_mode(640) }
  end

  it 'is idempotent on second run' do
    apply_manifest(manifest, expect_changes: false)
  end
end
