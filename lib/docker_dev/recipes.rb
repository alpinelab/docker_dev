module DockerDev
  module Recipes
    class << self
      def each &block
        constants
          .map { |e| const_get e }
          .select { |e| e.is_a? Class }
          .sort { |a, b| [*a.option][0] <=> [*b.option][0] }
          .each &block
      end
    end
  end
end
