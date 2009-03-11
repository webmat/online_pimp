module OnlinePimp::Verificators
  class ServiceExample
    attr_reader :name

    def initialize(name)
      @name = "http://example.com/#{name}"
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
