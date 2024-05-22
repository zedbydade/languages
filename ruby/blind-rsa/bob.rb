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

    p 'Signature procuded with Blind Rsa procedure'
    ap signature

    signature
  end

  def verify(signature, e, n)
    decoded_bytes = Base64.decode64(signature)
    sig = decoded_bytes.to_i(256)

    signed_message_bigint = sig.to_bn.mod_exp(e, n)

    signed_message = signed_message_bigint.to_s(2)

    initial_message = m.to_s(2)

    if signed_message == initial_message
      puts 'Verification of signature is tuturu'
    else
      puts 'Verification of signature is not tuturu'
    end
  end
end
