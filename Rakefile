begin; require 'rubygems'; rescue LoadError; end

require 'rake'
require 'rake/clean'
require 'rake/gempackagetask'
require 'time'
require 'date'
require "lib/name_parse"

PROJECT_SPECS = FileList[
  'spec/**/*.rb'
].reject { |h| h.match(/helper.rb/) }

PROJECT_MODULE = 'NameParse'
PROJECT_README = 'README'
#PROJECT_RUBYFORGE_GROUP_ID = 3034
PROJECT_COPYRIGHT = [
  "#          Copyright (c) #{Time.now.year} The Rubyists rubyists@rubyists.com",
  "# Distributed under the terms of the MIT license."
]

# To release the monthly version do:
# $ PROJECT_VERSION=2009.03 rake release
IGNORE_FILES = [/\.gitignore/]

GEMSPEC = Gem::Specification.new{|s|
  s.name         = 'name_parse'
  s.author       = "TJ Vanderpoel"
  s.summary      = "Parse name strings into their constituent parts"
  s.description  = s.summary
  s.email        = 'bougy.man@gmail.com'
  s.homepage     = 'http://github.com/bougyman/name_parse'
  s.platform     = Gem::Platform::RUBY
  s.version      = (ENV['PROJECT_VERSION'] || Object.const_get(PROJECT_MODULE)::VERSION)
  s.files        = `git ls-files`.split("\n").sort.reject { |f| IGNORE_FILES.detect { |exp| f.match(exp)  } }
  s.has_rdoc     = true
  s.require_path = 'lib'
  #s.bindir = "bin"
  #s.executables = ["name_parse"]
  s.rubyforge_project = "pastr"

  s.post_install_message = <<MESSAGE.strip
============================================================

Thank you for installing Name Parse!

============================================================
MESSAGE

"Verify your install with"
'# name-parse "Dr. Phil Seuss, Jr."'
}

Dir['tasks/*.rake'].each{|f| import(f) }

task :default => [:bacon]

CLEAN.include %w[
  **/.*.sw?
  *.gem
  .config
  **/*~
  **/{data.db,cache.yaml}
  *.yaml
  pkg
  rdoc
  ydoc
  *coverage*
]
