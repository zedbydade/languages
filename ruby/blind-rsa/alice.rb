require 'openssl'


class Alice < self
  def produce_key_pair 
    OpenSSL::PKey::RSA.generate(2048)
  end
end
