class SongList
  def initialize
    @songs = []
  end

  def append(song)
    @songs.push(song)
    self
  end

  def delete_first
    @songs.shift
  end

  def delete_last
    @songs.pop
  end

  def [](key)
    return @songs[key] if key.is_a?(Integer)

    @songs.find { |song| key == song.name }
  end
end

class Array
  def inject(n)
    each { |value| n = yield(n, value) }
  end

  def sum
    inject(0) { |n, value| n + value }
  end

  def product
    inject(1) { |n, value| n * value }
  end
end

class File
  def self.openAndProcess(*args)
    f = File.open(*args)
    yield f
    f.close
  end

  def self.myOpen(*args)
    afile = File.new(*args)
    if block_given?
      yield aFile
      aFile.close
      aFile = nil
    end
    aFile
  end
end

File.openAndProcess('testfile', 'r') do |aFile|
  print while aFile.gets
end
