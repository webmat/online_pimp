class OnlinePimp::Verificators::Domain
  def initialize(domain)
    raise ArgumentError, "Must be a complete domain with the tld" unless domain =~ /.+\..+/
    @domain = domain
  end
end
