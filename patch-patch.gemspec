# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'patch_patch/version'

Gem::Specification.new do |spec|
  spec.name          = 'patch-patch'
  spec.version       = PatchPatch::VERSION
  spec.authors       = ['Rémi Prévost']
  spec.email         = ['rprevost@mirego.com']
  spec.description   = 'PatchPatch changes Rails’ default behavior of mapping PUT and PATCH requests on resources to the same action.'
  spec.summary       = spec.description
  spec.homepage      = 'https://github.com/mirego/patch-patch'
  spec.license       = "BSD 3-Clause"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'actionpack', '>= 4.0.0'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
end
