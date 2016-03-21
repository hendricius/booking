# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'booking/version'

Gem::Specification.new do |spec|
  spec.name          = "booking-ruby"
  spec.version       = Booking::VERSION
  spec.authors       = ["Hendrik Kleinwaechter"]
  spec.email         = ["hendrik.kleinwaechter@gmail.com"]

  spec.summary       = %q{Wrapper for the Booking.com API written in ruby.}
  spec.homepage      = "https://github.com/hendricius/booking"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.license       = 'MIT'

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest"
  spec.add_dependency "faraday", "~> 0.9"
  spec.add_dependency "faraday_middleware"
end
