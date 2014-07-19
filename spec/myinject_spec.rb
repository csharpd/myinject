require 'myinject'

describe 'Myinject' do

  let (:myarray) {[1,2,3,4]}
  let (:big_array) {[100,3,2]}

  it 'raises an error if no block given' do
    expect{myarray.myinject}.to raise_error(LocalJumpError)
  end



  it 'returns nil if an empty array is given' do
    empty = []
    expect(empty.myinject {|acc,num| acc + num}).to eq nil
  end

  it 'is be able to accept an inital acc value' do
    expect(myarray.myinject(100) {|acc,num| acc + num}).to eq 110
  end

  it 'uses the first element as the acc if no initial value is provided' do
    expect(big_array.myinject {|acc,num| acc + num}).to eq 105
  end

  it 'the original array is still the same after myinject is called on it' do
    big_array.myinject {|acc,num| acc + num}
    expect(big_array).to eq [100,3,2]
  end

  it 'does calculations when an initial value is provided' do
    expect(myarray.myinject(100) {|acc,num| acc + num}).to eq 110
  end

  it ' does calculations when an initial value is NOT provided' do
    expect(myarray.myinject {|acc,num| acc + num}).to eq 10
  end

  it 'does calculations when a block is given in the shorthand format' do
    expect(myarray.myinject(&:+)).to eq 10
  end

  it 'does multiplication' do
    expect(myarray.myinject(1){|acc,num| acc * num}).to eq 24
  end


end