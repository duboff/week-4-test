class Takeaway
  attr_reader :price_list

  def initialize(price_list)
    @price_list = price_list
  end

  def place_order(quantities, total)
    sum = quantities.keys.inject(0) {|result, key| result + price_list[key] * quantities[key] }
    raise 'The total appears to be wrong' if total != sum
  end


end