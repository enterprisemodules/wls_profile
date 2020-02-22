require 'rubygems'
require 'pathname'

def optional_require(file)
  begin
    require "#{file}"
  rescue LoadError
    puts "#{file} not loaded."
  end
end

optional_require 'puppet-lint/tasks/puppet-lint'
optional_require 'puppet-syntax/tasks/puppet-syntax'
optional_require 'puppetlabs_spec_helper/rake_tasks'
optional_require 'puppet_blacksmith/rake_tasks'
optional_require 'puppet_litmus'
optional_require 'puppet_litmus/rake_tasks'
optional_require 'bolt_spec/run'
optional_require 'em_tasks/rake_tasks'

Dir.glob('../easy_type/lib/tasks/*.rake').each { |r| load r}

if defined?(RSpec)
  desc "Run the tests"
  RSpec::Core::RakeTask.new(:test) do |t|
    t.rspec_opts = ['--color', '-f d']
    t.pattern = 'spec/*/*_spec.rb'
  end
end

@module_name = 'wls_profile'

desc "Run Litmus setup"
task :litmus do
  # Project root
  proj_root = File.expand_path(File.join(File.dirname(__FILE__)))
  if `hostname`.include?('runner')
    Rake::Task['litmus:provision'].invoke('docker_exp', 'enterprisemodules/acc_base', ' -h orawls.example.com -v /software:/software')
  else
    Rake::Task['litmus:provision'].invoke('docker_exp', 'enterprisemodules/acc_base', '-h orawls.example.com -v $SOFTWARE_DIR:/software')
  end
  node_name = YAML.load_file("#{proj_root}/inventory.yaml").dig('groups',0,'nodes',0, 'name')
  ENV['TARGET_HOST'] = node_name
  use_latest_modules= ENV['USE_LATEST_MODULES']
  Rake::Task['litmus:install_agent'].invoke
  if use_latest_modules == 'yes' || File.file?(Dir.pwd+"/.fixtures_latest.yml")
    puts "USE_LATEST_MODULES"
    Rake::Task['spec_prep'].invoke
    Rake::Task['litmus:install_modules_from_directory'].invoke
  else
    Rake::Task['litmus:install_module'].invoke
  end
  Rake::Task['litmus:prepare'].invoke(node_name)
end

namespace :litmus do
  desc "Prepare the system for the tests"
  task :prepare, [:node_name] do |task, args|
    node_name = args['node_name']
    include BoltSpec::Run
    extend PuppetLitmus::Serverspec
    # Nothing for now
  end
end

namespace :litmus do
  desc 'install_module - build and install module'
  task :install_modules_from_directory, [:source, :target_node_name] do |_task, args|
    inventory_hash = inventory_hash_from_inventory_file
    target_nodes = find_targets(inventory_hash, args[:target_node_name])
    if target_nodes.empty?
      puts 'No targets found'
      exit 0
    end
    source_folder = if args[:source].nil?
                      './spec/fixtures/modules'
                    else
                      File.expand_path(args[:source])
                    end
    raise "Source folder doesnt exist #{source_folder}" unless File.directory?(source_folder)
    module_tars = build_modules_in_folder(source_folder)
    puts 'Building'
    module_tars.each do |module_tar|
      print "#{File.basename(module_tar)} "
    end
    require 'bolt_spec/run'
    include BoltSpec::Run
    puts "\nSending"
    module_tars.each do |module_tar|
      upload_file(module_tar.path, "/tmp/#{File.basename(module_tar)}", target_nodes, options: {}, config: nil, inventory: inventory_hash)
      print "#{File.basename(module_tar)} "
    end
    puts "\nInstalling"
    module_tars.each do |module_tar|
      # install_module
      install_module_command = "puppet module install --force /tmp/#{File.basename(module_tar)}"
      run_command(install_module_command, target_nodes, config: nil, inventory: inventory_hash)
      print "#{File.basename(module_tar)} "
    end
  end

end
def build_modules_in_folder(source_folder)
  folder_list = Dir.entries(source_folder).reject { |f| File.directory? f }
  module_tars = []
  opts = {}
  opts[:'target-dir'] = File.join(Dir.pwd, 'pkg')
  opts[:force] = true
  # remove old build folder if exists, before we build afresh
  FileUtils.rm_rf(opts[:'target-dir']) if File.directory?(opts[:'target-dir'])
  folder_list.each do |folder|
    folder_handle = Dir.open(File.join(source_folder, folder))
    if File.symlink?(folder_handle)
      opts[:module_dir] = __dir__
    else
      opts[:module_dir] = folder_handle.path
    end
    # build_module
    module_tar = build_module(opts)
    module_tars.push(File.new(module_tar))
  end
  module_tars
end
def build_module(opts)
  # old cli_way
  # pdk_build_command = 'bundle exec pdk build  --force'
  # stdout, stderr, _status = Open3.capture3(pdk_build_command)
  # raise "Failed to run 'pdk_build_command',#{stdout} and #{stderr}" if (stderr =~ %r{completed successfully}).nil?
  require 'pdk/module/build'
  require 'pdk/util'

  builder = PDK::Module::Build.new(opts)
  builder.build
end

if defined?(PuppetLint)
  PuppetLint.configuration.send("disable_140chars")
  # PuppetLint.configuration.send("disable_right_to_left_relationship")
  # PuppetLint.configuration.send("disable_autoloader_layout")
  # PuppetLint.configuration.send("disable_names_containing_dash")
  # PuppetLint.configuration.send("disable_class_inherits_from_params_class")
  # PuppetLint.configuration.send("disable_parameter_order")
  # PuppetLint.configuration.send("disable_inherits_across_namespaces")
  # PuppetLint.configuration.send("disable_nested_classes_or_defines")
  # PuppetLint.configuration.send("disable_variable_scope")
  # PuppetLint.configuration.send("disable_slash_comments")
  # PuppetLint.configuration.send("disable_star_comments")
  # PuppetLint.configuration.send("disable_selector_inside_resource")
  PuppetLint.configuration.send("disable_case_without_default")
  # PuppetLint.configuration.send("disable_documentation")
  # PuppetLint.configuration.send("disable_double_quoted_strings")
  # PuppetLint.configuration.send("disable_only_variable_string")
  # PuppetLint.configuration.send("disable_variables_not_enclosed")
  # PuppetLint.configuration.send("disable_single_quote_string_with_variables")
  # PuppetLint.configuration.send("disable_quoted_booleans")
  #--no-puppet_url_without_modules
  # PuppetLint.configuration.send("disable_variable_contains_dash")
  # PuppetLint.configuration.send("disable_hard_tabs")
  # PuppetLint.configuration.send("disable_trailing_whitespace")
  # PuppetLint.configuration.send("disable_2sp_soft_tabs")
  # PuppetLint.configuration.send("disable_arrow_alignment")
  # PuppetLint.configuration.send("disable_unquoted_resource_title")
  # PuppetLint.configuration.send("disable_ensure_first_param")
  # PuppetLint.configuration.send("disable_duplicate_params")
  # PuppetLint.configuration.send("disable_unquoted_file_mode")
  # PuppetLint.configuration.send("disable_file_mode")
  # PuppetLint.configuration.send("disable_ensure_not_symlink_target")
  #--no-unquoted_node_name

  exclude_paths = [
    "pkg/**/*",
    "vendor/**/*",
    "spec/**/*",
  ]
  PuppetLint.configuration.ignore_paths = exclude_paths
end

if defined?(PuppetSyntax)
  PuppetSyntax.exclude_paths = exclude_paths
end

desc "Run syntax, lint, and spec tests."
task :default => [
	:spec_prep,
	:syntax,
	:test,
	:lint,
	:spec_clean
]

begin
  require 'rubocop/rake_task'
  desc 'Run RuboCop on the lib directory'
  Rubocop::RakeTask.new(:rubocop) do |task|
    task.patterns = ['lib/**/*.rb']
    task.fail_on_error = true
  end
rescue LoadError, NameError
end
