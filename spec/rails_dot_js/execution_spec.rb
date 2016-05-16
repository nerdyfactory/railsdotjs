RSpec.describe RailsDotJs::Execution do
  class MockClass
    include RailsDotJs
  end

  before(:each) do
    @klass = MockClass.new
  end

  it "should return true when execute nod script" do
    @klass.set_config(:node_path, [File.expand_path(File.dirname(__FILE__)), '/../fixtures'].join)
		res = @klass.execute_node("test.js")
    expect(res).to eq(true)
  end
end
