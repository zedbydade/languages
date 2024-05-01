class TuTuTest
  TESTS = []
  def self.run(klass)
    klass.public_instance_methods.grep(/_test$/).each do |name|
      new.run(name)
      print '.'
    rescue StandardError => e
      puts
      puts "Failure: #{self}##{name}: #{e.message}"
      puts "  #{e.backtrace.first}"
    end
  end

  def self.inherited(x)
    TESTS << x
  end

  def self.run_all_tests
    TESTS.each do |klass|
      klass.run(klass)
    end
    puts
  end

  def run(name)
    send(name)
  end

  def test(_name)
    yield
  end

  def assert(test, msg = 'Failed test')
    return if test

    bt = caller.drop_while { |s| s =~ /#{__FILE__}/ }
    raise RuntimeError, msg, bt
  end

  def assert_equal(a, b)
    assert a == b, "Failed assert_equal #{a} vs #{b}"
  end

  def assert_in_delta(a, b)
    assert (a - b).abs <= 0.001, "Failed assert_in_delta #{a} vs #{b}"
  end
end
