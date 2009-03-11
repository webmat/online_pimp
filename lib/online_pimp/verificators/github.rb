module OnlinePimp::Verificators
  class Github < Base
    def initialize(name)
      @name = "http://github.com/#{name}"
    end
  end
end
