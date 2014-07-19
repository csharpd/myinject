require 'myinject'

describe 'Myinject' do

  let (:myarray) {[1,2,3,4]}


  it 'should return nil if an empty array is given' do
    empty = []
    expect(empty.myinject {|acc,num| acc + num}).to eq nil
  end

  it 'should be able to accept an inital acc value' do
    expect(myarray.myinject(100) {|acc,num| acc + num}).to eq 110
  end

  it 'should use the first element as the acc if no initial value is provided' do
    big_array = [100,3,2]
    expect(big_array.myinject {|acc,num| acc + num}).to eq 105

  end

  it 'should be able to do addition' do
    expect(myarray.myinject(0) {|acc,num| acc + num}).to eq 10
  end

  it 'should be able to do multiplication' do
    expect(myarray.myinject(1){|acc,num| acc * num}).to eq 24
  end


end