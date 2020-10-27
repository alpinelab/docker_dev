usage = <<-eoh
Usage: docker_dev [options]
    -h, --help                       print this message
        --compose-file-format FORMAT change docker compose file format
        --heroku KEY                 set Heroku API key as environment variable
        --mailcatcher                use MailCatcher
        --pgadmin                    use PGAdmin
        --port NUMBER                change "expose ports", modify environment
        --postgresql [IMAGE_TAG]     use PostgreSQL
        --procfile                   create files for foreman
        --ruby IMAGE_TAG             change the tag of `app' service image
        --vscode-remote-config       create `.devcontainer' directory
        --webpacker                  use Webpacker
eoh


Then 'the standard output must contain exactly the usage' do
  expect(last_command_started.output).to eq usage
end

Then 'the standard error must contain exactly the usage' do
  expect(last_command_started.stderr).to eq usage
end
