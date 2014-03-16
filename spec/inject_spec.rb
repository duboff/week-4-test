require 'inject'

describe 'Inject' do
  it 'calculates the sum of the array' do
    expect([1, 2, 3, 4].my_inject(1) { |result, element| result + element }).to eq 11
  end
  it 'calculates the sum of the array' do
    expect([1, 2, 3, 5].my_inject(0) { |result, element| result + element }).to eq 11
  end
    it 'calculates the sum of the array' do
    expect([1, 2, 10].my_inject(5) { |result, element| result + element }).to eq 18
  end
  it 'builds an array' do
    array = [1, 2, 3, 4, 5, 6].my_inject([]) do |result, element|
      result << element.to_s if element % 2 == 0
      result
    end
    expect(array) .to eq ["2", "4", "6"]
  end

  it 'finds the longest word' do
    a = %w{ cat sheep bear }.my_inject { |memo, word| memo.length > word.length ? memo : word }
    expect(a).to eq 'sheep'
  end

end

describe 'Recursive Inject' do
  it 'calculates the sum of the array' do
    expect([1, 2, 3, 4].inject_recursive { |result, element| result + element }).to eq 10
  end
  it 'calculates the sum of the array' do
    expect([1, 2, 3, 5].inject_recursive(0) { |result, element| result + element }).to eq 11
  end
    it 'calculates the sum of the array' do
    expect([1, 2, 10].inject_recursive(5) { |result, element| result + element }).to eq 18
  end
  it 'builds an array' do
    array = [1, 2, 3, 4, 5, 6].inject_recursive([]) do |result, element|
      result << element.to_s if element % 2 == 0
      result
    end
    expect(array) .to eq ["2", "4", "6"]
  end

  it 'finds the longest word' do
    a = %w{ cat sheep bear }.inject_recursive { |memo, word| memo.length > word.length ? memo : word }
    expect(a).to eq 'sheep'
  end

end