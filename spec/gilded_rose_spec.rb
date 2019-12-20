require 'gilded_rose'
require 'item'

describe GildedRose do

  let(:brie) { Brie.new("Aged Brie", 5, 20) }
  let(:quality_brie) { Brie.new("Aged Brie", 5, 50) }
  let(:backstage1) { BackstagePass.new("Backstage passes to a TAFKAL80ETC concert", 10, 10) }
  let(:backstage2) { BackstagePass.new("Backstage passes to a TAFKAL80ETC concert", 5, 10) }
  let(:backstage3) { BackstagePass.new("Backstage passes to a TAFKAL80ETC concert", 0, 10) }
  let(:cake) { BasicItem.new("chocolate cake", 1, 10) }
  let(:bad_cake) { BasicItem.new("bad cake", 5, 0) }
  let(:sulfuras) { Sulfuras.new("Sulfuras, Hand of Ragnaros", 0, 80) }
  let(:conjured) { ConjuredItem.new("Conjured item", 5, 10) }
  let(:conjured2) { ConjuredItem.new("Conjured item", 0, 10) }

  let(:items) { [brie, backstage1, backstage2, backstage3, cake, sulfuras, quality_brie, bad_cake, conjured, conjured2] }

  let(:gilded_rose) { described_class.new(items) }

    context 'conjured items' do

      it 'decreases conjured items quality value by 2 before sell-by date' do
        gilded_rose.update
        expect(gilded_rose.items[8].quality).to eq(8)
      end

      it 'decreases conjured items quality value by 4 after sell-by date' do
        gilded_rose.update
        expect(gilded_rose.items[9].quality).to eq(6)
      end

      it 'does not decrease conjured items value below 0' do
        gilded_rose.update
        gilded_rose.update
        gilded_rose.update
        gilded_rose.update
        gilded_rose.update
        expect(gilded_rose.items[9].quality).to eq(0)
      end

    end

end
