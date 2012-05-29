require 'rspec'
describe Greed, "#score" do

  before(:each) do
    @greed = Greed.new
  end

  it "should return 100 when a single 1 is rolled" do
    @greed.score([1]).should == 100
  end

  it "should return 50 when a single 5 is rolled" do
    @greed.score([5]).should == 50
  end

  it "should return correct score when three-of-a-kind rolled" do
    @greed.score([1,1,1]).should == 1000
    @greed.score([2,2,2]).should == 200
    @greed.score([3,3,3]).should == 300
    @greed.score([4,4,4]).should == 400
    @greed.score([5,5,5]).should == 500
    @greed.score([6,6,6]).should == 600
  end

  it "should return correct score when four-of-a-kind is rolled" do
    @greed.score([1,1,1,1]).should == 2000
    @greed.score([2,2,2,2]).should == 400
    @greed.score([3,3,3,3]).should == 600
    @greed.score([4,4,4,4]).should == 800
    @greed.score([5,5,5,5]).should == 1000
    @greed.score([6,6,6,6]).should == 1200
  end

  it "should return correct score when five-of-a-kind is rolled" do
    @greed.score([1,1,1,1,1]).should == 4000
    @greed.score([2,2,2,2,2]).should == 800
    @greed.score([3,3,3,3,3]).should == 1200
    @greed.score([4,4,4,4,4]).should == 1600
    @greed.score([5,5,5,5,5]).should == 2000
    @greed.score([6,6,6,6,6]).should == 2400
  end

  it "should return correct score when six-of-a-kind is rolled" do
    @greed.score([1,1,1,1,1,1]).should == 8000
    @greed.score([2,2,2,2,2,2]).should == 1600
    @greed.score([3,3,3,3,3,3]).should == 2400
    @greed.score([4,4,4,4,4,4]).should == 3200
    @greed.score([5,5,5,5,5,5]).should == 4000
    @greed.score([6,6,6,6,6,6]).should == 4800
  end

  it "should return 800 when three pairs are rolled" do
    @greed.score([4,4,3,3,6,6]).should == 800
    @greed.score([4,3,3,3,6,6]).should == 300
  end

  it "should return 1500 when a straight is rolled" do
    @greed.score([1,2,3,4,5,6]).should == 1500
    @greed.score([5,2,3,1,4,6]).should == 1500
  end
end
