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

end
