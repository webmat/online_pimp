require 'yaml'

require 'rubygems'
require 'universal_ruby_whois'


begin
  OPTIONS = YAML.load_file(File.expand_path("~/.online_pimp.yml"))
rescue
  warn "Config file not found at ~/.online_pimp.yml. Using default options"
  OPTIONS = {
    :twitter => true,
    :domains => %w(.com .org .net .ca)
  }
end

module OnlinePimp
  def self.verify_name(name)
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
    end
  end
end
