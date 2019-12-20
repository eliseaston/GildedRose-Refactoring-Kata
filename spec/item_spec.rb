require 'item'

describe Item do

  context 'BasicItem' do

    it 'decreases basic item quality value by 1' do
      basic_item = BasicItem.new("Cake", 5, 10)
      expect(basic_item.update_quality).to eq(9)
    end

    it 'decreases basic item sell in value by 1' do
      basic_item = BasicItem.new("Cake", 5, 10)
      expect(basic_item.update_sell_in).to eq(4)
    end

    it 'decreases basic item quality value by 2 after sell-by date' do
      sell_by_basic_item = BasicItem.new("Stale cake", 0, 5)
      expect(sell_by_basic_item.update_quality).to eq(3)
    end

    it 'does not decrease the quality value of an item wih 0 value' do
      zero_basic_item = BasicItem.new("Zero cake", 3, 0)
      zero_basic_item.update_quality
      expect(zero_basic_item.check_limits).to eq(0)
    end

  end

  context 'Brie' do

    it 'increases brie quality value by 1' do
      brie = Brie.new("Aged Brie", 5, 5)
      expect(brie.update_quality).to eq(6)
    end

    it 'decreases brie sell in value by 1' do
      brie = Brie.new("Aged Brie", 5, 5)
      expect(brie.update_sell_in).to eq(4)
    end

    it 'does not increase if brie quality value is 50' do
      super_brie = Brie.new("Super Brie", 3, 50)
      super_brie.update_quality
      expect(super_brie.check_limits).to eq(50)
    end

  end

  context 'Backstage passes' do

    it 'decreases the backstage pass sell in value by 1' do
      backstage_pass = BackstagePass.new("Backstage pass", 10, 10)
      expect(backstage_pass.update_sell_in).to eq(9)
    end

    it 'increases the backstage pass quality value by 1 more than 10 days before the gig' do
      longterm_backstage = BackstagePass.new("Backstage pass", 15, 10)
      expect(longterm_backstage.update_quality).to eq(11)
    end

    it 'increases the backstage pass quality value by 2 less than 10 days before the gig' do
      midterm_backstage = BackstagePass.new("Backstage pass", 9, 10)
      expect(midterm_backstage.update_quality).to eq(12)
    end

    it 'increases the backstage pass quality value by 3 less than 5 days before the gig' do
      shortterm_backstage = BackstagePass.new("Backstage pass", 3, 10)
      expect(shortterm_backstage.update_quality).to eq(13)
    end

    it 'reduces the backstage pass quality value to 0 after the gig has passed' do
      expired_backstage = BackstagePass.new("Backstage pass", 0, 10)
      expect(expired_backstage.update_quality).to eq(0)
    end

  end

  context 'Sulfuras' do

    let(:sulfuras) { Sulfuras.new("Sulfuras, Hand of Ragnaros", nil, 80) }

    it 'does not decrease the sell-in value of Sulfuras' do
      expect(sulfuras.update_sell_in).to eq(nil)
    end

    it 'does not alter the quality value of Sulfuras' do
      expect(sulfuras.update_quality).to eq(80)
    end

  end

  context 'Conjured Items' do

    it 'reduces conjured item sell-in value by 1' do
      conjured = ConjuredItem.new("Conjured item", 5, 10)
      expect(conjured.update_sell_in).to eq(4)
    end

    it 'reduces conjured item quality value by 2 before sell-by date' do
      conjured = ConjuredItem.new("Conjured item", 5, 10)
      expect(conjured.update_quality).to eq(8)
    end

    it 'reduces conjured item quality value by 4 after sell-by date' do
      expired_conjured = ConjuredItem.new("Conjured item", 0, 10)
      expect(expired_conjured.update_quality).to eq(6)
    end

    it 'does not decrease conjured item quality below 0' do
      zero_conjured = ConjuredItem.new("Conjured item", 0, 2)
      zero_conjured.update_quality
      expect(zero_conjured.check_limits).to eq(0)
    end

  end

end
