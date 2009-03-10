require 'rubygems'
require 'test/unit'
gem 'shoulda', '~> 2.0'
require 'shoulda'
gem 'seanhussey-woulda', '>= 0.2'
require 'woulda'
require 'mocha'

$TEST = true
OPTIONS = {
  :services => [:twitter],
  :tld => %w(.com .org .net .ca)
}
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'online_pimp'

class Test::Unit::TestCase
end
