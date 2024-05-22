require 'digest/sha1'
require 'openssl'
require 'securerandom'
require 'base64'

class Bob < self
  def mu(n, e)
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

    OpenSSL::BN.new((r.mod_exp(e, n) * m) % n)
  end

  def signature_calculation(mu_prime, n, r)

    s = r.mod_inverse(n).mod_mul(mu_prime, n)
    signature = Base64.encoded64(s.to_s(2))

    p "Signature procuded with Blind Rsa procedure"
    ap signature

    signature
  end

  def verify(signature)


  end
end
