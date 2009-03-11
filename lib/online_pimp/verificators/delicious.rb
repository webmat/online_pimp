module OnlinePimp::Verificators
  class Delicious < Base
    def initialize(name)
      @name = "http://delicious.com/#{name}"
    end
  end
end
