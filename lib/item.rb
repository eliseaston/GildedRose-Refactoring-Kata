class Item

  MIN_VALUE = 0
  MAX_VALUE = 50

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
  def update_quality
    @sell_in > 0 ? @quality -= 1 : @quality -= 2
  end

  def update_sell_in
    @sell_in -= 1
  end

  def check_limits
    @quality = MIN_VALUE if @quality < MIN_VALUE
  end
end


class BackstagePass < Item
  def update_quality
    if @sell_in <= 0
      @quality = 0
    elsif @sell_in <= 5
      @quality += 3
    elsif @sell_in <= 10
      @quality += 2
    else
      @quality += 1
    end
  end

  def update_sell_in
    @sell_in -= 1
  end

  def check_limits
    @quality = MAX_VALUE if @quality > MAX_VALUE
    @quality = MIN_VALUE if @quality < MIN_VALUE
  end
end


class Brie < Item
  def update_quality
    @quality += 1
  end

  def update_sell_in
    @sell_in -= 1
  end

  def check_limits
    @quality = MAX_VALUE if @quality > MAX_VALUE
  end
end


class Sulfuras < Item
  def update_quality
    @quality
  end

  def update_sell_in
    @sell_in
  end

  def check_limits
  end
end


class ConjuredItem < Item
  def update_quality
    @sell_in > 0 ? @quality -= 2 : @quality -= 4
  end

  def update_sell_in
    @sell_in -= 1
  end

  def check_limits
    @quality = MAX_VALUE if @quality > MAX_VALUE
    @quality = MIN_VALUE if @quality < MIN_VALUE
  end
end
