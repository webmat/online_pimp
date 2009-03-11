module OnlinePimp::Verificators
  class Base
    attr_reader :name

    def available?
      RestClient.get(name, :accept => '*/*')
      false
    rescue RestClient::ResourceNotFound
      true
    rescue => ex
      warn "Error (#{self.class}, #{name}): #{ex.inspect}"
      nil
    end
  end
end
