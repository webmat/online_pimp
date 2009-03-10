require 'rubygems'
require 'test/unit'
require 'shoulda'
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
