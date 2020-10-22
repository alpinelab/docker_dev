RSpec.describe DockerDev::ConfigsGenerator do
  describe '#configs' do
    it 'returns a default "docker-compose" config' do
      expect(subject.configs[:docker_compose]).not_to be_empty
    end
  end

  describe '#add_recipe' do
    it 'uses the given recipe to update the configs' do
      subject.add_recipe (Class.new do
        def initialize configs, _; @configs = configs.dup; end
        def apply; @configs.merge foo: :bar; end
      end), nil

      expect(subject.configs).to include(
        docker_compose: Hash,
        foo: :bar
      )
    end
  end
end
