RSpec.configure do |c|
  c.mock_with :rspec
end

require 'puppetlabs_spec_helper/module_spec_helper'
require 'rspec-puppet-facts'
require 'puppet-catalog_rspec'

include RspecPuppetFacts

default_facts = {
  puppetversion: Puppet.version,
  facterversion: Facter.version,
}

default_facts_path = File.expand_path(File.join(File.dirname(__FILE__), 'default_facts.yml'))
default_module_facts_path = File.expand_path(File.join(File.dirname(__FILE__), 'default_module_facts.yml'))

if File.exist?(default_facts_path) && File.readable?(default_facts_path)
  default_facts.merge!(YAML.safe_load(File.read(default_facts_path)))
end

if File.exist?(default_module_facts_path) && File.readable?(default_module_facts_path)
  default_facts.merge!(YAML.safe_load(File.read(default_module_facts_path)))
end


RSpec.configure do |c|
  c.hiera_config = File.expand_path(File.join(__FILE__, '../fixtures/hiera.yaml'))
  c.default_facts = default_facts
  c.default_facter_version = '3.14.0'
end

RSpec.shared_context 'specify passwords' do
  let(:pre_condition) {
    """
      class { 'Wls_profile':
        weblogic_password => Sensitive('Welcome01'),
      }
      class { 'wls_profile::basic_domain::wls_domain':
        weblogic_password => Sensitive('Welcome01'),
        repository_password => Sensitive('Welcome01'),
      }
    """
  }
end
