require 'array'

describe "The Ruby Array class" do
	let(:array) { [1,2,3,4,5] }
	it "should respond to the random_groups_of message" do
		array.random_groups_of(2)
	end
end

describe "random_groups_of" do
	let(:array) { [1,2,3,4,5] }
	let(:group_size) { 2 }
	
	it "should return empty array when given a nil" do
		y = array.random_groups_of(nil)
		y.should be_empty
	end

	it "should return empty array when given a group size of zero" do
		y = array.random_groups_of(0)
		y.should be_empty
	end

	it "should return an array of equal size made up of array of size 1" do
		y = array.random_groups_of(1)
		y.size.should == array.size
		y[0].size == 1
	end
	
	it "should return empty array when the original array is empty" do
		y = [].random_groups_of(group_size)
		y.should be_empty
	end
	
	it "should return an array of arrays containing every element of the original" do
		y = array.random_groups_of(group_size)
		y.should_not be_empty
		y.size.should == array.size / 2 + (array.size % group_size == 0 ? 0 : 1)
		y[0].should_not be_empty
		y.flatten.sort.should == array
	end
	
	it "should return an array of size 1 containing an array of all elements" do
		gs = 10
		y = array.random_groups_of(gs)
		y.should_not be_empty
		y.size.should == 1
		y[0].size.should == array.size
		y.flatten.sort.should == array
	end
end