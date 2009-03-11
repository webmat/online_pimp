module OnlinePimp::Verificators
  class Twitter < Base
    def initialize(name)
      @name = "http://twitter.com/#{name}"
    end
  end
end

