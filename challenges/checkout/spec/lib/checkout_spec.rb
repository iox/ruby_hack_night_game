  # Item   Unit      Special
  #       Price     Price
  # --------------------------
  #   A     50       3 for 130
  #   B     30       2 for 45
  #   C     20
  #   D     15

require "checkout"


describe Checkout do
  RULES = {
      'A' => [50, [3, 130]],
      'B' => [30, [2, 45]],
      'C' => [20],
      'D' => [15]
  }

  def price_of(goods)
    checkout = Checkout.new(RULES)
    goods.split(//).each { |item| checkout.scan(item) }
    checkout.total
  end
  
  it 'calculates empty totals correctly' do
    expect(price_of('')).to eq(0)
  end

  it 'calculates multiple products correctly' do
    expect(price_of('A')).to eq(50)
    expect(price_of('AB')).to eq(80)
    expect(price_of('CDBA')).to eq(115)
  end
  
  it 'calculates repeated products correctly' do
    expect(price_of('AA')).to eq(100)
    expect(price_of('AAA')).to eq(130)
    expect(price_of('AAAA')).to eq(180)
    expect(price_of('AAAAA')).to eq(230)
    expect(price_of('AAAAAA')).to eq(260)

    expect(price_of('AAAB')).to eq(160)
    expect(price_of('AAABB')).to eq(175)
    expect(price_of('AAABBD')).to eq(190)
    expect(price_of('DABABA')).to eq(190)
  end

  it 'calculates totals incrementally' do
    co = Checkout.new(RULES)
    expect(co.total).to eq(0)
    co.scan('A'); expect(co.total).to eq(50)
    co.scan('B'); expect(co.total).to eq(80)
    co.scan('A'); expect(co.total).to eq(130)
    co.scan('A'); expect(co.total).to eq(160)
    co.scan('B'); expect(co.total).to eq(175)
  end
end
