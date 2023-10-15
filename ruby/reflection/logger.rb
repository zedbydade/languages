class Logger
  def self.add_logging; end

  def log(_msg)
    warn Time.now
  end
end

class AttrLogger
  def self.attr_logger(name)
    define_method("#{name}=") do |val|
      puts "Assigning #{val.inspect} to #{name}}"
      instance_variable_set("@#{name}", val)
    end

    define_method("#{name}") do
      puts "Reading #{name}"
      instance_variable_get("@#{name}")
    end
  end
end

class Example < AttrLogger
  attr_logger :value
end

ex = Example.new
ex.value = 6
ex.value
