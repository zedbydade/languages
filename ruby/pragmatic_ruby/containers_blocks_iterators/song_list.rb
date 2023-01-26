class SongList
  def initialize
    @songs = []
  end

  def append(song)
    @songs.push(song)
    self
  end
end
