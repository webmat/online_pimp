require File.dirname(__FILE__) + '/test_helper'

class OnlinePimpTest < Test::Unit::TestCase
  context "length_of_longest" do
    should "return -1 when the array is empty" do
      assert_equal -1, OnlinePimp::Internal.length_of_longest([])
    end

    should "return 4 when the longest item is 4 long" do
      assert_equal 4, OnlinePimp::Internal.length_of_longest([ 'adsf', 'd' ])
    end
  end

  context "display()" do
    should "just return a string" do
      assert_kind_of String, OnlinePimp.display()
    end

    should "display stuff properly" do
      assert_equal "twitter.com/webmat : taken\n", 
        OnlinePimp.display('twitter.com/webmat' => false)
    end
  end
  context "when expanding the verifications" do
  end
end
