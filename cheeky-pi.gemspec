# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cheeky-pi/version'

Gem::Specification.new do |s|
  s.name          = 'cheeky-pi'
  s.version     = CheekyPi::VERSION
  s.date          = '2013-04-10'
  s.summary       = "PI led helper"
  s.description   = "Simple usbled ruby library"
  s.authors       = ["Billiam"]
  s.email         = 'billiamthesecond@gmail.com'
  s.files         = `git ls-files`.split($/)
  s.homepage      = 'http://github.com/billiam/cheeeky-pi'
  s.require_paths = ["lib"]

  s.add_dependency('eventmachine', '~> 1.0.3')
  s.add_dependency('em-promise', '~> 1.1.1')
end