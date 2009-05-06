#          Copyright (c) 2009 The Rubyists rubyists@rubyists.com
# All files in this distribution are subject to the terms of the MIT license.

require 'spec/helper'

describe "Name Parser" do


  it "Should Parse A First and Last Name Without Commas" do
    name_p_std = NameParse["TJ Vanderpoel"]
    name_p_std.first.should == "TJ"
    name_p_std.last.should == "Vanderpoel"
  end

  it "Should Parse A Standard Name With Commas" do
    name_p_std = NameParse["Vanderpoel, T.J."]
    name_p_std.first.should == "T.J."
    name_p_std.last.should == "Vanderpoel"
  end
  
  it "Should Parse A First, Middle Initial, and Last Without Commas" do
    name_p_std = NameParse["Tom J Rogers"]
    name_p_std.first.should == "Tom"
    name_p_std.middle.should == "J"
    name_p_std.middle_i.should == "J"
    name_p_std.last.should == "Rogers"
  end

  it "Should Parse A Prefix, First, Middle Initial (with period), and Last Without Commas" do
    name_p_std = NameParse["Mr James T. Kirk"]
    name_p_std.prefix.should == "Mr"
    name_p_std.first.should == "James"
    name_p_std.middle.should == "T."
    name_p_std.middle_i.should == "T"
    name_p_std.last.should == "Kirk"
  end

  it "Should Parse A First, Middle Initial, and Last With Commas" do
    name_p_std = NameParse["Rogers, Tom J"]
    name_p_std.first.should == "Tom"
    name_p_std.middle.should == "J"
    name_p_std.middle_i.should == "J"
    name_p_std.last.should == "Rogers"
  end

  it "Should Parse A First, Middle Name, and Last Without Commas" do
    name_p_std = NameParse["Tom James Rogers"]
    name_p_std.first.should == "Tom"
    name_p_std.middle.should == "James"
    name_p_std.middle_i.should == "J"
    name_p_std.last.should == "Rogers"
  end

  it "Should Parse A First, Middle Name, and Last With Commas" do
    name_p_std = NameParse["Rogers, Tom James"]
    name_p_std.first.should == "Tom"
    name_p_std.middle.should == "James"
    name_p_std.middle_i.should == "J"
    name_p_std.last.should == "Rogers"
  end

  it "Should Parse A 'Von Something' Name Without Commas" do
    name_p_std = NameParse["TJ Von Trapp"]
    name_p_std.first.should == "TJ"
    name_p_std.last.should == "Von Trapp"
  end

  it "Should Parse A 'Von Something' Name With Commas" do
    name_p_std = NameParse["Von Trapp, T.J."]
    name_p_std.first.should == "T.J."
    name_p_std.last.should == "Von Trapp"
  end

  it "Should Parse A 'Van Something' Name Without Commas" do
    name_p_std = NameParse["TJ Van Poel"]
    name_p_std.first.should == "TJ"
    name_p_std.last.should == "Van Poel"
  end

  it "Should Parse A 'Van de Something' Name Without Commas" do
    name_p_std = NameParse["TJ Van de Poel"]
    name_p_std.first.should == "TJ"
    name_p_std.last.should == "Van de Poel"
  end

  it "Should Parse A 'Van der Something' Name Without Commas" do
    name_p_std = NameParse["TJ Van der Poel"]
    name_p_std.first.should == "TJ"
    name_p_std.last.should == "Van der Poel"
  end

  it "Should Parse A 'De la Something' Name Without Commas" do
    name_p_std = NameParse["Oscar De la Hoya"]
    name_p_std.first.should == "Oscar"
    name_p_std.last.should == "De la Hoya"
  end

  it "Should Parse A Doctor's Name" do
    name_p_long = NameParse["Dr Phil Seuss"]
    name_p_long.first_name.should == "Phil"
    name_p_long.last.should == "Seuss"
    name_p_long.prefix.should == "Dr"
  end

end
