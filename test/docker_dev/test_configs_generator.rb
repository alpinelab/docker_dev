require 'test_helper'

class ConfigsGeneratorSpec < DockerDevSpec
  describe DockerDev::ConfigsGenerator do
    subject { DockerDev::ConfigsGenerator.new }

    describe '#configs' do
      it 'returns a default "docker-compose" config' do
        _(subject.configs[:docker_compose]).wont_be :empty?
      end
    end

    describe '#add_recipe' do
      it 'uses the given recipe to update the configs' do
        subject.add_recipe (Class.new do
          def initialize configs, _; @configs = configs.dup; end
          def apply; @configs.merge foo: :bar; end
        end), nil

        _(subject.configs[:docker_compose]).wont_be :empty?
        _(subject.configs[:foo]).must_equal :bar
      end
    end
  end
end
