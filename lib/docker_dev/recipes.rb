module DockerDev
  module Recipes
    class << self
      def each &block
        constants
          .map { |e| const_get e }
          .select { |e| e.is_a? Class }
          .each &block
      end
    end
  end
end
