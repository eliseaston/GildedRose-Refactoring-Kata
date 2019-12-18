require 'gilded_rose'
require 'item'

describe GildedRose do

  # let(:sulfuras) { Item.new("Sulfuras, Hand of Ragnaros", nil, 80) }
  let(:brie) { Item.new("Aged Brie", 5, 20) }
  let(:backstage) { Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 10) }
  let(:cake) { Item.new("chocolate cake", 3, 10) }

  let(:items) { [brie, backstage, cake] }

  let(:gilded_rose) { described_class.new(items) }

  describe "#update_quality" do

    it 'decreases the sell-in and quality value of a normal item by 1' do
      gilded_rose.update_quality
      expect(gilded_rose.items[2].sell_in).to eq(2)
      expect(gilded_rose.items[2].quality).to eq(9)
    end

  end

end
