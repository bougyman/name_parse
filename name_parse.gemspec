# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{name_parse}
  s.version = "0.0.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["TJ Vanderpoel"]
  s.date = %q{2009-05-06}
  s.description = %q{========================================================= Name Parse Copyright (c) 2009 The Rubyists (Jayson Vaughn, Tj Vanderpoel, Michael Fellinger, Kevin Berry)  Distributed under the terms of the MIT License. ==========================================================  About ----- A ruby library for turning arbitrary name strings such as "Dr Helen Hunt", "Mr James T. Kirk" into a  standardized object usable as  parsed = NameParse::Parser.new("Dr Helen Hunt") puts "%s %s" % [parsed.first, parsed.last]   Requirements ------------ - ruby (>= 1.8)  Usage -----  Example of using on a list:  bougyman@zero:~/git_checkouts/name_parse$ irb -r lib/name_parse irb(main):001:0> list = ["Jayson Vaughn", "Dr Helen Hunt",  "Mr James T. Kirk"] => ["Jayson Vaughn", "Dr Helen Hunt", "Mr James T. Kirk"] irb(main):002:0> list.map { |n| p = NameParse[n]; [p.first, p.last] } => [["Jayson", "Vaughn"], ["Helen", "Hunt"], ["James", "Kirk"]]   Support ------- Home page at http://github.com/bougyman/name_parse #rubyists on FreeNode}
  s.email = %q{bougy.man@gmail.com}
  s.files = ["AUTHORS", "CHANGELOG", "MANIFEST", "README", "Rakefile", "lib/name_parse.rb", "lib/name_parse/error.rb", "lib/name_parse/parser.rb", "lib/name_parse/version.rb", "name_parse.gemspec", "spec/helper.rb", "spec/name_parse/parser.rb", "tasks/authors.rake", "tasks/bacon.rake", "tasks/changelog.rake", "tasks/copyright.rake", "tasks/gem.rake", "tasks/gem_installer.rake", "tasks/install_dependencies.rake", "tasks/manifest.rake", "tasks/rcov.rake", "tasks/release.rake", "tasks/reversion.rake", "tasks/setup.rake", "tasks/yard.rake"]
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
