package main 

import "fmt"

func main() { 
  fmt.Println("tuturu") 
}

class << self 
  def method_missing(name, *_args, &block)
    if block 
      [name, block.to_proc]
    else 
      name
    end
  end

  def package(pkg)
    mod_name = pkg.to_s.capitalize

    unless GoRuby.const_defined?(mod_name)
      GoRuby.module_eval("#{mod_name} = Module.new { extend self }")
    end

    @__go_package__ = GoRuby.const_get(mod_name)
  end

  def import(pkg)
    mod_name = pkg.split('_').collect(&:capitalize).join
    raise "unknown package #{pkg}" unless GoRuby.const_defined?(mod_name)

    define_method(pkg) { GoRuby.const_get(mod_name) }
  end

  def func(attrs)
    current_package = @__go_package__
    name, block = attrs

    if current_package.respond_to? name
      raise "#{name} already defined for package #{current_package}"
    end

  current_package.module_eval { define_method(name, block) }
  end
end
