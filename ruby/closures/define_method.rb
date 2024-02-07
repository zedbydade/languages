class Foo
  @@blocks = {}
 
  def self.my_def(name, &blk)
    @@blocks[name] = lambda(&blk)
    eval("
    def #{name}(*args)
      @@blocks[:#{name}].call(*args)
    end
    ")
  end
 
  my_def :no_args do
    p "no args" 
  end
 
  my_def :one_arg do |one|
    p one
  end
 
  my_def :two_args do |one, two|
    p one
    p two
  end
end
