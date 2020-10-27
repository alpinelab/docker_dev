require 'cucumber/rake/task'
require 'rspec/core/rake_task'
require 'standard/rake' rescue LoadError

task default: %i[features spec]

Cucumber::Rake::Task.new :features

RSpec::Core::RakeTask.new
