class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end

class BasicItem < Item
  def update

  end
end

class BackstagePass < Item
  def update
  end
end

class Brie < Item
  def update

  end
end

class Sulfuras < Item
  def update

  end
end

class ConjuredItem < Item
  def update
    
  end
end
