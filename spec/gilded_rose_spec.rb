require 'gilded_rose'
require 'item'

describe GildedRose do

  let(:brie) { Item.new("Aged Brie", 5, 20) }
  let(:quality_brie) { Item.new("Aged Brie", 5, 50) }
  let(:backstage1) { Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 10) }
  let(:backstage2) { Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 10) }
  let(:backstage3) { Item.new("Backstage passes to a TAFKAL80ETC concert", 0, 10) }
  let(:cake) { Item.new("chocolate cake", 1, 10) }
  let(:bad_cake) { Item.new("bad cake", 5, 0) }
  let(:sulfuras) { Item.new("Sulfuras, Hand of Ragnaros", 0, 80) }

  let(:items) { [brie, backstage1, backstage2, backstage3, cake, sulfuras, quality_brie, bad_cake] }

  let(:gilded_rose) { described_class.new(items) }

  describe "#update_quality" do

    context 'normal items' do

      it 'decreases the sell-in and quality value of a normal item by 1' do
        gilded_rose.update_quality
        expect(gilded_rose.items[4].sell_in).to eq(0)
        expect(gilded_rose.items[4].quality).to eq(9)
      end

      it 'decreases the quality value of a normal item twice as much after sell in date' do
        gilded_rose.update_quality
        gilded_rose.update_quality
        expect(gilded_rose.items[4].sell_in).to eq(-1)
        expect(gilded_rose.items[4].quality).to eq(7)
      end

      it 'does not decrease the quality value of an item wih 0 value' do
        gilded_rose.update_quality
        expect(gilded_rose.items[7].quality).to eq(0)
      end

    end

    context 'brie' do

      it 'decreases the sell-in and increases the quality value of brie' do
        gilded_rose.update_quality
        expect(gilded_rose.items[0].sell_in).to eq(4)
        expect(gilded_rose.items[0].quality).to eq(21)
      end

      it 'does not increase the quality value of brie with quality value of 50' do
        gilded_rose.update_quality
        expect(gilded_rose.items[6].quality).to eq(50)
      end

    end

    context 'backstage passes' do

      it 'decreases the sell-in and increases by 2 the quality of backstage pass less than 10 days before gig' do
        gilded_rose.update_quality
        expect(gilded_rose.items[1].sell_in).to eq(9)
        expect(gilded_rose.items[1].quality).to eq(12)
      end

      it 'decreases the sell-in and increases by 3 the quality of backstage pass less than 5 days before gig' do
        gilded_rose.update_quality
        expect(gilded_rose.items[2].sell_in).to eq(4)
        expect(gilded_rose.items[2].quality).to eq(13)
      end

      it 'decreases the sell-in and reduces the quality to 0 of a backstage pass after the gig' do
        gilded_rose.update_quality
        expect(gilded_rose.items[3].sell_in).to eq(-1)
        expect(gilded_rose.items[3].quality).to eq(0)
      end

    end

    context 'sulfuras' do

      it 'does not decrease the sell-in or quality values of Sulfuras' do
        gilded_rose.update_quality
        expect(gilded_rose.items[5].sell_in).to eq(0)
        expect(gilded_rose.items[5].quality).to eq(80)
      end

    end

  end
end
