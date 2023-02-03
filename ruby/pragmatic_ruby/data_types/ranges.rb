class VU
  include Comparable

  attr :volume

  def initialize(volume)
    @volume = volume
  end

  def inspect
    '#' * @volume
  end

  # Support for ranges

  def <=>(other)
    volume <=> other.volume
  end

  def succ
    raise(IndexError, 'Volume too big') if @volume >= 9

    VU.new(@volume.succ)
  end
end
