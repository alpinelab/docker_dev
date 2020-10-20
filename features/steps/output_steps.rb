usage = <<-eoh
Usage: docker_dev [options]
    -h, --help                       print this message
        --heroku KEY                 set Heroku API key as environment variable
        --mailcatcher                use MailCatcher
        --pgadmin                    use PGAdmin
        --port NUMBER                change "expose ports", modify environment
        --postgresql [image tag]     use PostgreSQL
        --webpacker                  use Webpacker
eoh


Then 'the standard output must contain exactly the usage' do
  expect(last_command_started.output).to eq usage
end

Then 'the standard error must contain exactly the usage' do
  expect(last_command_started.stderr).to eq usage
end
