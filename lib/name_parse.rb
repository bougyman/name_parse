require "pathname"
$LOAD_PATH.unshift(Pathname.new(__FILE__).dirname.expand_path.to_s)
module NameParse
end
require "name_parse/version"
