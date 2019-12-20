require_relative 'item'

class GildedRose

  attr_reader :items

  def initialize(items)
    @items = items
  end

  def update
    @items.each do |item|
      item.update_quality
      item.update_sell_in
      item.check_limits
    end
  end

end
