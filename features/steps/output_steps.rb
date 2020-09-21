usage = <<-eoh
Usage: docker_dev [options]
    -h, --help                       print this message
        --postgresql                 use PostgreSQL
eoh


Then 'the standard output must contain exactly the usage' do
  expect(last_command_started.output).to eq usage
end

Then 'the standard error must contain exactly the usage' do
  expect(last_command_started.stderr).to eq usage
end

Then 'the output must match YAML:' do |expected|
  expect(YAML.load last_command_started.output).to eq YAML.load expected
end
