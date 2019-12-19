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
      when item.name.include?("Backstage passes")
        update_backstage(item)
      when item.name == "Sulfuras, Hand of Ragnaros"
      else
        update_item(item)
      end
      item.sell_in -= 1 unless item.name == "Sulfuras, Hand of Ragnaros"
    end
  end

  private

  def update_brie(item)
    item.quality += 1 unless item.quality >= 50
  end

  def update_backstage(item)
    p "Called update backstage method"
    if item.sell_in <= 0
      item.quality = 0
    elsif item.sell_in <= 5
      item.quality += 3 unless item.quality >= 50
    elsif item.sell_in <= 10
      item.quality += 2 unless item.quality >= 50
    else
      item.quality += 1 unless item.quality >= 50
    end
  end


  def update_item(item)
    if item.sell_in > 0
      item.quality -= 1 unless item.quality == 0
    else
      item.quality -= 2 unless item.quality <= 1
    end
  end

end
