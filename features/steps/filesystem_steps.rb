Then 'the content of {string} file must match YAML:' do |filename, expected|
  expect(YAML.load File.read expand_path filename).to eq YAML.load expected
end
