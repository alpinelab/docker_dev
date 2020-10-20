require 'cucumber/rake/task'
require 'rake/testtask'

task default: %i[features test]

Cucumber::Rake::Task.new :features

Rake::TestTask.new do |t|
  t.libs << 'test'
  t.pattern = 'test/**/test_*.rb'
end
