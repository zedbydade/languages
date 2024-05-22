require 'openssl'

class Alice < self
  def produce_key_pair
    OpenSSL::PKey::RSA.generate(2048)
  end

  def calculate_mu_prime_with_chinese_remainder_theorem(mu, n)
    p = OpenSSL::BN.new(key.params['p'])
    q = OpenSSL::BN.new(key.params['q'])
    d = OpenSSL::BN.new(key.params['d'])
    n_bn = OpenSSL::BN.new(n)
    mu_bn = OpenSSL::BN.new(mu)

    m1 = mu_bn.mod_exp(d, n_bn).mod(p)
    m2 = mu_bn.mod_exp(d, n_bn).mod(q)

    q_inverse_mod_p = q.mod_inverse(p)
    p_inverse_mod_q = p.mod_inverse(q)

    m1_bn = OpenSSL::BN.new(m1)
    m2_bn = OpenSSL::BN.new(m2)
    q_bn = OpenSSL::BN.new(q)
    p_bn = OpenSSL::BN.new(p)

    q_inverse_mod_p_bn = OpenSSL::BN.new(q_inverse_mod_p)
    p_inverse_mod_q_bn = OpenSSL::BN.new(p_inverse_mod_q)

    (m1_bn * q_bn * q_inverse_mod_p_bn) + (m2_bn * p_bn * p_inverse_mod_q_bn) & n_bn
  end
end
