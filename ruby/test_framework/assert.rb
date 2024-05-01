require_relative 'tu_tu_test'

class TestAsserts < TuTuTest
  def first_test
    assert_equal 1, 1
  end

  def second_test
    assert_equal 2, 2
  end

  def third_test
    assert_equal 1, 1
  end

  def five_test
    assert_equal 1, 2
  end
end

TuTuTest.run_all_tests
