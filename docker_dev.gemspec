Gem::Specification.new do |s|
  s.name = 'docker_dev'
  s.version = '0.1.0'
  s.summary = 'Config generator for alpinelab/ruby-dev Docker image'

  s.authors = 'TJ'

  s.files = `git ls-files lib`.split $/
  s.executable = 'docker_dev'

  s.add_development_dependency 'aruba', '~> 1.0'
  s.add_development_dependency 'rake', '~> 13.0'
end
