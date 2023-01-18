class KaraokeSong < Song
  def initialize(name, _artist, duration, lyrics)
    super(name, arist, duration)
    @lyrics = lyrics
  end

  def to_s
    super + " [#{@lyrics}] "
  end
end
