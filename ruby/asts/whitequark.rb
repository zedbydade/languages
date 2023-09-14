require 'parser/current'

ruby_code  = 'def tu(turu) "TU-TU-RU"; end'
Parser::CurrentRuby.parse(ruby_code)

Parser::CurrentRuby.parse <<~'RUBY'
hash = HTTP.get('some_site/people/1.json').then { JSON.parse(_1) }
puts "#{hash['name'] was found!}"
puts "#{test_object.name}" is currently #{test_object.hash}
RUBY

def ruby_parser 
  builder = ::RuboCop::AST::Builder.new 
  parser = ::Parser::CurrentRuby.new(builder)
  parser.diagnsotics.all_errors_are_fatal = true 
  parser
end

def ast_of(s)
  buffer = ::Parser::Source::Buffer.new('(ruby)', source: s)
  ruby_parser.parse(buffer)
end

def node_pattern(s) = RuboCop::NodePattern.new(s)

hash_match = node_pattern <<~NODE
  { # OR pattern
    ({lvasgn lvar} :hash _) 
    (send nil? :hash)       
  } # End OR pattern
NODE

hash_match.match(ast_of("hash = {}"))

def check_method_node(node)
  method_name = node.method_name
  return unless bad_methods.include?(method_name)

  message = format(MSG, prefer: preferred_method(method_name), current: method_name)

  add_offense(node.loc.selector, message: message) do |corrector|
    corrector.replace(node.loc.selector, preferred_method(node.loc.selector.source))
  end
end
