RSpec.describe RailsDotJs::Execution do
  class MockClass
    include RailsDotJs::Execution
  end

  before(:each) do
    @klass = MockClass.new
  end

  it "should return node scripts output" do
		@klass.execute_script("test.js", path: File.expand_path(File.join(File.dirname(__FILE__), '../../fixtures')))
  end
end
