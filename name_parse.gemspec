# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{name_parse}
  s.version = "2009.05.06"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["TJ Vanderpoel"]
  s.date = %q{2009-05-06}
  s.description = %q{Parse name strings into their constituent parts}
  s.email = %q{bougy.man@gmail.com}
  s.files = ["Rakefile", "lib/name_parse.rb", "lib/name_parse/version.rb", "tasks/authors.rake", "tasks/bacon.rake", "tasks/changelog.rake", "tasks/copyright.rake", "tasks/gem.rake", "tasks/gem_installer.rake", "tasks/install_dependencies.rake", "tasks/manifest.rake", "tasks/rcov.rake", "tasks/release.rake", "tasks/reversion.rake", "tasks/setup.rake"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/bougyman/name_parse}
  s.post_install_message = %q{============================================================

Thank you for installing Name Parse!

============================================================}
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{pastr}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Parse name strings into their constituent parts}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
