module OnlinePimp::Verificators
  class Twitter
    attr_reader :name
    def initialize(name)
      @name = "http://twitter.com/#{name}"
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
    # ResourceNotFound (404): name available
    # 502: bad gateway, retry
  end
end

