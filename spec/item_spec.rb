require 'item'

describe Item do

  # it "does not change the name" do
  #   items = [Item.new("foo", 0, 0)]
  #   expect(items[0].name).to eq "foo"
  # end

  context 'BasicItem' do
    let(:basic_item) { BasicItem.new("Cake", 5, 10)}

    it 'decreases basic item quality value by 1' do
      expect(basic_item.update_quality).to eq(9)
    end

    it 'decreases basic item sell in value by 1' do
      expect(basic_item.update_sell_in).to eq(4)
    end

    it 'decreases basic item quality value by 2 after sell-by date' do
      sell_by_basic_item = BasicItem.new("Stale cake", 0, 5)
      expect(sell_by_basic_item.update_quality).to eq(3)
    end

  end

end
