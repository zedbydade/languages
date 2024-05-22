require_relative 'bob'
require_relative 'alice'

class BlindRsa
  def self.call
    long = Time.now.to_i
    alice_pair = Alice.produce_key_pair
    alice_private = alice_pair.to_pem
    alice_public = alice_pair.public_key.to_pem
    n = alice_public.n
    e = alice_public.e
    mu = Bob.mu(n, e)
    mu_prime = Alice.calculate_mu_prime_with_chinese_remainder_theoreum(mu, n)
    sig = Bob.signature_calculation(mu_prime, n, e)
    Bob.verify(sig, n, e)
  end
end
