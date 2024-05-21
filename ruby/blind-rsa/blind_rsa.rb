class BlindRsa 
  def self.call 
    long = Time.now.to_i
    alice_pair = Alice.produce_key_pair
    alice_private = alice_pair.to_pem
    alice_public = alice_pair.public_key.to_pem
    n = alice_public.n
    e = alice_public.e

 

  end
end
