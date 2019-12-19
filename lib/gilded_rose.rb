class GildedRose

  attr_reader :items

  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      case
      when item.name == "Aged Brie"
        update_brie(item)
      when item.name.include?("Backstage")
        update_backstage(item)
      when item.name == "Sulfuras, Hand of Ragnaros"
      else
        update_item(item)
      end
      unless item.name == "Sulfuras, Hand of Ragnaros"
        item.sell_in -= 1
        check_limits(item)
      end
    end
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

  def update_item(item)
    item.sell_in > 0 ? item.quality -= 1 : item.quality -= 2
  end

  def check_limits(item)
    if item.quality > 50
      item.quality = 50
    elsif item.quality < 0
      item.quality = 0
    end
  end

end
