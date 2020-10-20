require 'minitest/autorun'
require 'minitest/reporters'

require 'docker_dev'

class DockerDevSpec < Minitest::Spec
  def described_class
    self.class.const_get self.class.name.sub /::(?:\.|#).+\z/, ''
  end
end

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
