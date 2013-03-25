require 'test/unit'
require 'facegem'

class FaceGemTest < Test::Unit::TestCase
  def test_english_hello
    assert_equal "hello world",
      GraphAPI.hi
  end
end
