require 'optparse'
require 'docker_dev/config_generator'

module DockerDev
  class CLI
    ArgumentError = Class.new ArgumentError

    EX_USAGE = 64

    class << self
      def run arguments
        cli = new arguments, output: $stdout
        cli.parse_arguments
        cli.run
      rescue ArgumentError => e
        $stderr.puts e
        exit EX_USAGE
      end
    end

    def initialize arguments, output:
      @arguments = arguments
      @output = output
      @config_generator = ConfigGenerator.new
    end

    def parse_arguments
      parser.parse! @arguments
    rescue OptionParser::InvalidOption
      fail ArgumentError, parser
    end

    def run
      @output.print @config_generator.dump
    end

  private

    def parser
      OptionParser.new do |o|
        o.on '-h', '--help', 'print this message' do
          @output.print o
          exit
        end

        o.on '--postgresql', 'use PostgreSQL' do
          @config_generator.add :postgresql
        end
      end
    end
  end
end
