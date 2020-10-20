require 'test_helper'

class ConfigFilesWriterSpec < DockerDevSpec
  describe DockerDev::ConfigFilesWriter do
    describe '.write' do
      def tmpdir
        Dir.mktmpdir 'docker_dev-test' do |dir|
          Dir.chdir dir do
            yield
          end
        end
      end

      it 'writes files based on given hash' do
        tmpdir do
          described_class.write docker_compose: "content\n"
          _(File.read 'docker-compose.yaml').must_equal "content\n"
        end
      end

      it 'serialises values as YAML when not string' do
        tmpdir do
          described_class.write docker_compose: { foo: :bar }
          _(YAML.load File.read 'docker-compose.yaml').must_equal foo: :bar
        end
      end
    end
  end
end
