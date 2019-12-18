class GildedRose

  attr_reader :items

  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|

      p item.name
      p item.sell_in
      case
      when item.name == "Aged Brie"
        update_brie(item)
      when item.name.include?("Backstage passes")
        update_backstage(item)
      when item.name.include?("Sulfuras")
        update_sulfuras(item)
      else
        update_item(item)
      end

    end
  end

  private

  def update_brie(item)
    item.sell_in -= 1
    item.quality += 1 unless item.quality >= 50
  end

  def update_backstage(item)
    p "Called update backstage method"
    if item.sell_in <= 0
      item.sell_in -= 1
      item.quality = 0
    elsif item.sell_in <= 5
      item.sell_in -= 1
      item.quality += 3 unless item.quality >= 50
    elsif item.sell_in <= 10
      item.sell_in -= 1
      item.quality += 2 unless item.quality >= 50
    else
      item.sell_in -= 1
      item.quality += 1
    end
  end

  def update_sulfuras(item)
    item.sell_in = item.sell_in
    item.quality = item.quality
  end

  def update_item(item)
    if item.sell_in > 0
      item.sell_in -= 1
      item.quality -= 1 unless item.quality == 0
    else
      item.sell_in -= 1
      item.quality -= 2
    end
  end

end
