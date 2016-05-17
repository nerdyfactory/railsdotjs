RSpec.describe RailsDotJs do
  class MockClass
    include RailsDotJs
  end

  before(:each) do
    @klass = MockClass.new
  end

  it "should changed config value by set_config" do
    @klass.set_config(:node_path, "/")
    res = @klass.fetch_config(:node_path)
    expect(res).to eq("/")
  end
end
