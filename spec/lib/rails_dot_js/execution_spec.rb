RSpec.describe RailsDotJs::Execution do
  class MockClass
    include RailsDotJs
  end

  before(:each) do
    @klass = MockClass.new
    @klass.set_config(:node_path, [File.expand_path(File.dirname(__FILE__)), '/../../fixtures'].join)
    @klass
  end

  it "should return true when execute node script" do
		res = @klass.execute_node("test.js")
    expect(res).to eq(true)
  end

  it "should stord pid when node script run as daemon" do
    @klass.set_config(:daemonize, true)
		res = @klass.execute_node("daemon.js")
    @klass.stop_daemons
    expect(res).to eq(true)
  end
end
