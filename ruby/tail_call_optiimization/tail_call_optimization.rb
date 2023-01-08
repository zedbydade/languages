require 'method_source'

module TailCallOptimization
  def tail_recursive(name)
    fn = instance_method(name)

    RubyVM::InstructionSequence.compile_option = {
      tailcall_optimization: true,
      trace_instruction: false
    }

    RubyVM::InstructionSequence.new(<<-EOS).eval
      class #{self}
        #{fn.source}
      end
    EOS
  end
end

