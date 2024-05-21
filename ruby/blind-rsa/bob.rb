require 'digest/sha1'
require 'openssl'
require 'securerandom'

class Bob < self
  def mu(_rsa_key, n, e)
    message = Digest::SHA1.hexdigest('X').bytes.pack('C*')

    m = OpenSSL::BN.new(message, 2)

    one = OpenSSL::BN.new(1)
    gcd = nil
    r = nil

    while gcd != one || r >= n || r <= one
      random_bytes = SecureRandom.random_bytes(10)
      r = OpenSSL::BN.new(random_bytes, 2)
      gcd = r.gcd(N)
    end

    (r.mod_exp(e, n) * m) % n
  end
end
