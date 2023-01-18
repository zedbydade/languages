class SongList
  MaxTime = 5 * 60

  def self.isTooLong(aSong)
    aSong.duration > MaxTime
  end
end
