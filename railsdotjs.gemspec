Gem::Specification.new do |s|
  s.name        = 'railsdotjs'
  s.version     = '0.0.1'
  s.date        = '2016-05-07'
  s.summary     = 'Node.js environment for Rails applications'
  s.description = 'Node.js environment for Rails applications'
  s.authors     = ['Jonghun Yu']
  s.email       = 'jonghun.yu@nerdyfactory.com'
  s.files       = Dir['lib/**/*']
  s.test_files  = Dir['test/**/*']
  s.homepage    = 'https://github.com/nerdyfactory/railsdotjs'
  s.license 		= 'MIT'

  #dependency 
  s.add_dependency 'rails', '>= 3.2'
  s.add_dependency 'redis', '>= 3.2'
  s.add_dependency 'daemons'


  #dev dependency 
  s.add_development_dependency "rspec"
  s.add_development_dependency "pry"
end
