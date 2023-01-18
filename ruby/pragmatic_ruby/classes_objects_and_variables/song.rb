class Song
  attr_accessor :duration
  attr_reader :name, :artist

  def initialize(name, artist, duration)
    @name = name
    @artist = artist
    @duration = duration
  end

  def to_s
    "Song: #{@name}--#{@artist} (#{@duration})"
  end

  def durationInMinutes
    @duration / 60.0
  end

  def durationInMinutes=(value)
    @duration = (value * 60).to_i
  end
end
