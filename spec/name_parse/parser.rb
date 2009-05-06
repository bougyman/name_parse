#          Copyright (c) 2009 The Rubyists rubyists@rubyists.com
# All files in this distribution are subject to the terms of the MIT license.

require 'spec/helper'

describe "Name Parser" do


  it "Should Parse A First and Last Name Without Commas" do
    name = NameParse["TJ Vanderpoel"]
    name.first.should == "TJ"
    name.last.should == "Vanderpoel"
    name.matched.should == :first_last
  end

  it "Should Parse A Standard Name With Commas" do
    name = NameParse["Vanderpoel, T.J."]
    name.first.should == "T.J."
    name.last.should == "Vanderpoel"
    name.matched.should == :last_comma_first_mid
  end
  
  it "Should Parse A First, Middle Initial, and Last Without Commas" do
    name = NameParse["Tom J Rogers"]
    name.first.should == "Tom"
    name.middle.should == "J"
    name.middle_i.should == "J"
    name.last.should == "Rogers"
  end

  it "Should Parse A Prefix, First, Middle Initial (with period), and Last Without Commas" do
    name = NameParse["Mr James T. Kirk"]
    name.prefix.should == "Mr"
    name.first.should == "James"
    name.middle.should == "T."
    name.middle_i.should == "T"
    name.last.should == "Kirk"
  end

  it "Should Parse A First, Middle Initial, and Last With Commas" do
    name = NameParse["Rogers, Tom J"]
    name.first.should == "Tom"
    name.middle.should == "J"
    name.middle_i.should == "J"
    name.last.should == "Rogers"
  end

  it "Should Parse A First, Middle Name, and Last Without Commas" do
    name = NameParse["Tom James Rogers"]
    name.first.should == "Tom"
    name.middle.should == "James"
    name.middle_i.should == "J"
    name.last.should == "Rogers"
  end

  it "Should Parse A First, Middle Name, and Last With Commas" do
    name = NameParse["Rogers, Tom James"]
    name.first.should == "Tom"
    name.middle.should == "James"
    name.middle_i.should == "J"
    name.last.should == "Rogers"
  end

  it "Should Parse A 'Von Something' Name Without Commas" do
    name = NameParse["TJ Von Trapp"]
    name.first.should == "TJ"
    name.last.should == "Von Trapp"
  end

  it "Should Parse A 'Von Something' Name With Commas" do
    name = NameParse["Von Trapp, T.J."]
    name.first.should == "T.J."
    name.last.should == "Von Trapp"
  end

  it "Should Parse A 'Van Something' Name Without Commas" do
    name = NameParse["TJ Van Poel"]
    name.first.should == "TJ"
    name.last.should == "Van Poel"
  end

  it "Should Parse A 'Van de Something' Name Without Commas" do
    name = NameParse["TJ Van de Poel"]
    name.first.should == "TJ"
    name.last.should == "Van de Poel"
  end

  it "Should Parse A 'Van der Something' Name Without Commas" do
    name = NameParse["TJ Van der Poel"]
    name.first.should == "TJ"
    name.last.should == "Van der Poel"
  end

  it "Should Parse A 'De la Something' Name Without Commas" do
    name = NameParse["Oscar De la Hoya"]
    name.first.should == "Oscar"
    name.last.should == "De la Hoya"
  end

  it "Should Parse A Doctor's Name" do
    name = NameParse["Dr Phil Seuss"]
    name.first.should == "Phil"
    name.last.should == "Seuss"
    name.prefix.should == "Dr"
  end

  it "Should Parse a Name with C/O as Prefix" do
    name = NameParse["C/O Chris Elrod"]
    name.first.should == "Chris"
    name.last.should == "Elrod"
    name.prefix.should == "C/O"
  end

  it "Should parse a 2 lastname name with a comma" do
    name = NameParse["Alfredo Lorenzo, Frank"]
    name.first.should == "Frank"
    name.last.should == "Alfredo Lorenzo"
  end

end
