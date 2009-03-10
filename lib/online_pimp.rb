require 'yaml'

require 'rubygems'
require 'andand'
require 'activesupport'
require 'universal_ruby_whois'

module OnlinePimp
  module Verificators
  end
end
Dir[ File.dirname(__FILE__) + '/online_pimp/verificators/*.rb' ].each do |f|
  require f
end

unless $TEST
  begin
    OPTIONS = YAML.load_file(File.expand_path("~/.online_pimp.yml"))
  rescue
    warn "Config file not found at ~/.online_pimp.yml. Using default options"
    OPTIONS = {
      :services => [:twitter],
      :tld => %w(.com .org .net .ca)
    }
  end
end

module OnlinePimp
  def self.verify_name(name)
    abort "You must specify a name to check, for example:\nop webmat"
    verifications = Internal.expand_verifications(name, OPTIONS)
    {}
  end

  def self.display(results = {})
    resulting_string = ''
    length = Internal.length_of_longest(results.keys)
    results.each_pair do |result|
      name, availability = *result
      resulting_string << "%-#{length}s : %s\n" % 
                            [name, (availability ? "available" : "taken")]
    end
    resulting_string
  end

  module Internal
    class << self
      def length_of_longest(strings)
        longest = -1
        strings.each do |r|
          longest = r.length if r.length > longest
        end
        longest
      end

      def expand_verifications(name, options)
        verifications  = []
        options[:tld].andand.each do |tld|
          tld = '.' + tld unless tld =~ /^\./
          verifications << Verificators::Domain(name + tld)
        end
        options[:service].andand.each do |service|
          verifications << Kernel.const_get("Verificators::#{service.capitalize}").new(name)
        end
        verifications
      end
    end
  end
end
