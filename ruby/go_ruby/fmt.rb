module Fmt 
  class << self 
    def Println(*attrs)
      str = "#{attrs.join(' ')}\n"
      $stdout << str
      [str.bytesize, nil]
    end
  end
end
