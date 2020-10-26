require 'tmpdir'

RSpec.describe DockerDev::ConfigFilesWriter do
  describe '.write' do
    around do |example|
      Dir.mktmpdir 'docker_dev-test' do |dir|
        Dir.chdir dir do
          example.run
        end
      end
    end

    it 'writes files based on given hash' do
      described_class.write docker_compose: "content\n"
      expect(File.read 'docker-compose.yaml').to eq "content\n"
    end

    it 'writes files in subdirectories' do
      described_class.write devcontainer: "content\n"
      expect(File.read '.devcontainer/devcontainer.json').to eq "content\n"
    end

    it 'serialises values as YAML when not string' do
      described_class.write docker_compose: { foo: :bar }
      expect(YAML.load File.read 'docker-compose.yaml').to eq foo: :bar
    end
  end
end
