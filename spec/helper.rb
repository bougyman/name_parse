require "pathname"
begin
  require "bacon"
rescue LoadError
  require "rubygems"
  require "bacon"
end

begin
  if (local_path = Pathname.new(__FILE__).dirname.join("..", "lib", "name_parse.rb")).file?
    require local_path
  else
    require "name_parse"
  end
rescue LoadError
  require "rubygems"
  require "name_parse"
end
