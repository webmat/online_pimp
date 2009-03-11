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
    OPTIONS = HashWithIndifferentAccess.new(
      YAML.load_file(File.expand_path("~/.online_pimp.yml")))
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
    abort "You must specify a name to check, for example:\nop webmat" unless name
    verifications = Internal.expand_verifications(name, OPTIONS)
    verifications.inject({}) {|memo, v| 
      memo[v.name] = v.available? 
      sleep(1)
      memo
    }
  end

  def self.display(results = {})
    resulting_string = ''
    length = Internal.length_of_longest(results.keys)
    results.each_pair do |name, availability|
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
          verifications << OnlinePimp::Verificators::Domain.new(name + tld)
        end
        options[:service].andand.each do |service|
          verifications << OnlinePimp::Verificators.const_get(service.to_s.capitalize).new(name)
        end
        verifications
      end
    end
  end
end
