songs = SongList.new

songFile.each do |line|
  file, length, name, title = line.chomp.split(/\s*\|\s*/)
  name.squeeze!('')
  mins, secs = length.scan(/\d+/)
  songs.append Song.new(title, name, mins.to_i * 60 + secs.to_i)
end

class WordIndex 
  def initialize
    @index = Hash.new(nil)
  end

  def index(an_object, *phrases)
  phrases.each do |a_phrase| 
    a_phrase.scan/\w[-\w']+/ do |a_word| 
      a_word.downcase!
      @index[a_word] = [] if @index[a_word].nil?
      @index[a_word].push(an_object)
  end

  def lookup(a_word)
    @index[a_word.downcase]
  end
end

