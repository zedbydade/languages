require 'sexp_processor'
require 'ruby_parser'

class UbyInterpreter < SexpInterpreter
  VERSION = '1.0.0'

  attr_accessor :parser

  def initialize
    super

    self.parser = RubyParser.new
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
