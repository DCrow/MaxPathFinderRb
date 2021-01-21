require_relative "lib/max_path_finder/version"

Gem::Specification.new do |spec|
  spec.name          = "max_path_finder"
  spec.version       = MaxPathFinder::VERSION
  spec.authors       = ["Yaroslav Barkovskiy"]
  spec.email         = ["kuroimist@gmail.com"]

  spec.summary       = "Find maximum sum for an n-tree"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")
  spec.files = Dir["lib/**/*", "LICENSE.txt", "README.md", "CHANGELOG.md"]
end
