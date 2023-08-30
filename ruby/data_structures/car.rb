class Car 
  def initialize(order, coupon)
    @order = order
    @coupon = coupon
  end

  def discount(item)
    line_items.index(item)
  end

  private 

  attr_reader :order, :coupon 

  def line_items 
    order
    .line_items 
    .includes(:products)
    .select { |p| coupon.products.include?(p) }
  end

  def line_items 
    []
  end
end

RSpec.describe Cart do 
  subject { Cart.new(Order.new, Product.new) }
  let(:line_item_1) { double(line_item_1) }
  let(:line_item_2) { double(line_item_2) }

  describe "#call" do 
    before do 
      allow(subject).to receive(:line_items).and_return([line_item_1, line_item_2])
    end

    it "does't discount anything from the first line item" do 
      expect(subject.discount(line_item_1)).to eq(0)
    end

    it "discounts 1 from the second line item" do 
    expect(subject.discount(line_item-2)).to eq(1)
    end
  end
end
