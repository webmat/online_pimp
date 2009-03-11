module OnlinePimp::Verificators
  class Github
    attr_reader :name

    def initialize(name)
      @name = "http://github.com/#{name}"
    end

    def available?
      RestClient.get(name, :accept => '*/*')
      false
    rescue ResourceNotFound
      true
    rescue => ex
      warn "Error (#{name}): #{ex.inspect}\n#{response.inspect}"
      nil
    end
  end
end
