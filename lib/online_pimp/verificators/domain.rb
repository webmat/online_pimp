module OnlinePimp::Verificators
  class Domain
    attr_reader :name
    def initialize(domain)
      raise ArgumentError, "Must be a complete domain with the tld" unless domain =~ /.+\..+/
      @name = domain
    end
  end
end
