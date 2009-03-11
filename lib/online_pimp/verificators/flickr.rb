module OnlinePimp::Verificators
  class ServiceExample
    attr_reader :name

    def initialize(name)
      @name = "http://example.com/#{name}"
    end

    def available?
      true
    end
  end
end
