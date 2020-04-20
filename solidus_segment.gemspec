# frozen_string_literal: true

require_relative 'lib/solidus_segment/version'

Gem::Specification.new do |spec|
  spec.name = 'solidus_segment'
  spec.version = SolidusSegment::VERSION
  spec.authors = ['Alessio Rocco']
  spec.email = 'alessiorocco@nebulab.it'

  spec.summary = 'Track Solidus user events with Segment'
  spec.description = 'Use Segment to track user events'
  spec.homepage = 'https://github.com/nebulab/solidus_segment'
  spec.license = 'BSD-3-Clause'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/nebulab/solidus_segment'
  spec.metadata['changelog_uri'] = 'https://github.com/nebulab/solidus_segment/releases'

  spec.required_ruby_version = Gem::Requirement.new('~> 2.4')

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  files = Dir.chdir(__dir__) { `git ls-files -z`.split("\x0") }

  spec.files = files.grep_v(%r{^(test|spec|features)/})
  spec.test_files = files.grep(%r{^(test|spec|features)/})
  spec.bindir = "exe"
  spec.executables = files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'solidus_core', ['>= 2.0.0', '< 3']
  spec.add_dependency 'solidus_support', '>= 0.4', '< 0.6'

  spec.add_development_dependency 'solidus_dev_support'
end