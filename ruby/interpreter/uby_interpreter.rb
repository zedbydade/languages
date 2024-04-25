require 'sexp_processor'
require 'ruby_parser'

class UbyInterpreter < SexpInterpreter
  VERSION = '1.0.0'

  attr_accessor :parser, :env

  def initialize
    super

    self.parser = RubyParser.new
    self.env = {}
  end

  def process_lvar(s)
    _, name = s

    env[name]
  end

  def process_lasgn(s)
    _, n, v = s
    env[n] = process(v)
  end

  def process_block(s)
    result = nil
    s.rest.each do |sub|
      result = process(sub)
    end
    result
  end

  def process_nil(_s)
    nil
  end

  def process_true(_s)
    true
  end

  def process_false(_s)
    false
  end

  def process_if(s)
    _, c, t, f = s

    c = process(c)

    if c
      process t
    else
      process f
    end
  end

  def process_call(s)
    _, recv, msg, *args = s

    recv = process(recv)
    args.map! { |sub| process(sub) }

    recv.send(msg, *args)
  end

  def process_lit(s)
    s.last
  end

  def eval(src)
    process(parse(src))
  end

  def parse(src)
    parser.process(src)
  end
end
