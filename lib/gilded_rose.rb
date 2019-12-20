require_relative 'item'

class GildedRose

  MIN_VALUE = 0
  MAX_VALUE = 50

  attr_reader :items

  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each(&:update)
  end

  def update_quality
    @items.each do |item|
      case
      when item.name == "Aged Brie"
        update_brie(item)
      when item.name.include?("Backstage")
        update_backstage(item)
      when item.name == "Sulfuras, Hand of Ragnaros"
      when item.name == "Conjured item"
        update_conjured(item)
      else
        update_item(item)
      end
      unless item.name == "Sulfuras, Hand of Ragnaros"
        update_sellin(item)
        check_limits(item)
      end
    end
  end

  def update_sellin(item)
    item.sell_in -= 1
  end


  private

  def update_brie(item)
    item.quality += 1
  end

  def update_backstage(item)
    if item.sell_in <= 0
      item.quality = 0
    elsif item.sell_in <= 5
      item.quality += 3
    elsif item.sell_in <= 10
      item.quality += 2
    else
      item.quality += 1
    end
  end

  def update_conjured(item)
    item.sell_in > 0 ? item.quality -= 2 : item.quality -= 4
  end

  def update_item(item)
    item.sell_in > 0 ? item.quality -= 1 : item.quality -= 2
  end

  def check_limits(item)
    item.quality = MAX_VALUE if item.quality > MAX_VALUE
    item.quality = MIN_VALUE if item.quality < MIN_VALUE
  end

end
