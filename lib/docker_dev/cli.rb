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
      @configs_generator = ConfigsGenerator.new
    end

    def parse_arguments
      parser.parse! @arguments
    rescue OptionParser::ParseError
      fail ArgumentError, parser
    end

    def run
      ConfigFilesWriter.write @configs_generator.configs
    end

  private

    def parser
      OptionParser.new do |o|
        o.on '-h', '--help', 'print this message' do
          @output.print o
          exit
        end

        DockerDev::Recipes.each do |recipe|
          o.on recipe.option, recipe.description do |arg|
            @configs_generator.add_recipe recipe, arg
          end
        end
      end
    end
  end
end
