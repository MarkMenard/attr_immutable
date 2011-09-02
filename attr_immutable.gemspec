# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "attr_immutable/version"

Gem::Specification.new do |s|
  s.name        = "attr_immutable"
  s.version     = AttrImmutable::VERSION
  s.authors     = ["Mark Menard"]
  s.email       = ["mark@mjm.net"]
  s.homepage    = ""
  s.summary     = %q{Add attr_immutable to create immutable protected attributes on your Ruby classes.}
  s.description = %q{AttrImmutable add the attr_immutable class method to create immutable properties on Ruby classes. The attribute are only accessible using the accessor/mutator pair by hiding the attribute value using a closure. (ie. the immutable attribute is not stored in an instance variable and therefore can't accessed in any other way.)}

  s.rubyforge_project = "attr_immutable"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
