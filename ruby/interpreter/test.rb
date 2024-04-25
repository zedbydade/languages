require 'minitest'
require 'minitest/autorun'
require_relative './uby_interpreter'

class TestUbyInterpreter < Minitest::Test
  attr_accessor :int

  def setup
    self.int = UbyInterpreter.new
  end

  def assert_eval(exp, src, msg = nil)
    assert_equal(exp, int.eval(src), msg)
  end

  def test_defn
    assert_eval nil, <<~EOM
     def double(n)
       2 * n
     end
    EOM

    assert_eval 42, "double(21)"
  end

  def test_sanity
    assert_eval(3, '3')
    assert_eval(7, '3 + 4')
  end

  def test_lvar
    assert_eval 42, 'x = 42; x'
  end

  def test_if
    assert_eval 42, 'if true  then 42 else 24 end'
  end

  def test_if_falsey
    assert_eval 24, 'if nil  then 42 else 24 end'
    assert_eval 24, 'if false then 42 else 24 end'
  end
end
