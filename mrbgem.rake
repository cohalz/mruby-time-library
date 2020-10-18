MRuby::Gem::Specification.new('mruby-time-library') do |spec|
  spec.license = 'MIT'
  spec.authors = 'cohalz'

  spec.add_dependency 'mruby-time', :core => 'mruby-time'
  spec.add_dependency 'mruby-sprintf', :core => 'mruby-sprintf'

  spec.add_test_dependency 'mruby-env', :github => 'iij/mruby-env'
end
