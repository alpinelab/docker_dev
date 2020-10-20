Gem::Specification.new do |s|
  s.name = 'docker_dev'
  s.version = '1.0.0'
  s.summary = 'Config generator for alpinelab/ruby-dev Docker image'

  s.authors = 'AlpineLab'

  s.files = `git ls-files lib`.split $/
  s.executable = 'docker_dev'

  s.add_development_dependency 'aruba', '~> 1.0'
  s.add_development_dependency 'minitest', '~> 5.14'
  s.add_development_dependency 'minitest-reporters', '~> 1.4'
  s.add_development_dependency 'rake', '~> 13.0'
end
