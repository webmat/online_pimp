module OnlinePimp::Verificators
  class Flickr < Base
    def initialize(name)
      @name = "http://flickr.com/photos/#{name}"
    end
  end
end
