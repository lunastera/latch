# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'latch/version'

Gem::Specification.new do |spec|
  spec.name          = "latch"
  spec.version       = Latch::VERSION
  spec.authors       = ["宇野嵐"]
  spec.email         = ["araera48@gmail.com"]

  spec.summary       = 'This is a simple latch for thread control.'
  spec.description   = <<-EOS
  This gem will be useful if you want to have certain threads execute concurrently
  in multiple threads like Java's CountDownLatch.
  EOS
  spec.homepage      = "https://github.com/sobreera/latch.git"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
end
