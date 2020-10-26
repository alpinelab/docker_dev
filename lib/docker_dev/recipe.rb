module DockerDev
  class Recipe
    def initialize configs, arg
      @configs, @arg = configs.dup, arg
    end
  end
end
