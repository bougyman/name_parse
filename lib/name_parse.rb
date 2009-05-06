require "pathname"
$LOAD_PATH.unshift(Pathname.new(__FILE__).dirname.expand_path.to_s)
require "name_parse/parser"
module NameParse
  def self.[](string)
    Parser.new(string)
  end
end
require "name_parse/version"
require "name_parse/error"

