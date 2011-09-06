require 'attr_immutable'

class TestClass
  include AttrImmutable
  attr_immutable :immutable_attr
end

describe 'attr_immutable' do
  it "attributes should be nil unless set" do
    test_object = TestClass.new
    test_object.immutable_attr.should be_nil
  end
  
  it "can be set once and read" do
    test_object = TestClass.new
    test_object.immutable_attr = 'foo'
    test_object.immutable_attr.should == 'foo'
  end
  
  it "should raise an exception if an attr_immutable is set a second time" do
    test_object = TestClass.new
    test_object.immutable_attr = 'foo'
    lambda { test_object.immutable_attr = 'foo' }.should raise_error
  end
end