require 'takeaway'

describe Takeaway do
  
  let (:dish_list) {{'apple' => 2, 'steak' => 20, 'salad' => 10, 'burger' => 15}}
  let (:takeaway) {Takeaway.new(dish_list)}
  
  it 'has a list of dishes on initialization' do
    expect(takeaway.price_list.class).to eq Hash
    expect(takeaway.price_list).to eq dish_list
  end

  it 'can read prices off the price list' do
    expect(takeaway.price_list['apple']).to eq 2
  end

  it 'raises error when total is wrong' do
    expect(lambda {takeaway.place_order({'burger' => 2, 'salad' => 1}, 5)}).to raise_error(RuntimeError)
  end
  it 'no error when total is right' do
    expect(lambda {takeaway.place_order({'burger' => 2, 'salad' => 1}, 40)}).not_to raise_error
  end


end