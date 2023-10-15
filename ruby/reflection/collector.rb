class Collector
  include Enumerable

  attr_reader :items

  def initialize(collection)
    @items = collection
  end

  def each
    @items.each do |item|
      yeild item
    end
  end

  def to_s
    @items.to_s
  end
end
