#          Copyright (c) 2009 The Rubyists rubyists@rubyists.com
# All files in this distribution are subject to the terms of the MIT license.

require 'spec/helper'

describe "Name Parser" do

  before do
    @raw_name_std = "TJ Vanderpoel"
    @raw_name_std_comma = "Vanderpoel, T.J."
    @raw_name_prefixed = "Dr Phil Seuss"
  end

  it "Should Parse A Standard Name Without Commas" do
    name_p_std = NameParse::Parser.new(@raw_name_std)
    name_p_std.first.should == "TJ"
    name_p_std.last.should == "Vanderpoel"
  end

  it "Should Parse A Standard Name With Commas" do
    name_p_std = NameParse::Parser.new(@raw_name_std_comma)
    name_p_std.first.should == "T.J."
    name_p_std.last.should == "Vanderpoel"
  end

  it "Should Parse A Doctor's Name" do
    name_p_long = NameParse::Parser.new(@raw_name_prefixed)
    name_p_long.first_name.should == "Phil"
  end

end
