module NameParse
  class Parser
    attr_reader :first, :last, :suffix, :prefix, :middle, :raw, :matched
    attr_accessor :first_name_re, :last_name_re, :middle_name_re, :prefix_re

    def initialize(name_string = nil, options = {})
      @options = options
      @last_name_re = @options[:last_name_re] || /(?:(?:v[ao]n(?:\s+der?)?|de\s+la)\s+)?\w[-.'\w]+/i
      @middle_name_re = @options[:middle_name_re] || /\w(?:\.|[-.'\w]+)?/
      @prefix_re = @options[:prefix_re] || /(?:c\/o|dr|mrs?|ms|miss|mister|sgt|cpt|cpl)\.?/i
      @first_name_re = @options[:first_name_re] || /\w[-.'\w]+/
      parse(name_string) if name_string
    end

    def parse(name)
      @raw = name
      case name
      # just "Firstname Lastname"
      when first_last
        first_last($~)
      # Catch names with prefixes, no comma
      when pre_first_last
        pre_first_last($~)
      # Catch names with prefixes and middle names, no comma
      when pre_first_mid_last
        pre_first_mid_last($~)
      # just "Firstname Middle Lastname"
      when first_mid_last
        first_mid_last($~)
      # just "Lastname, Firstname (Middle)" middle is optional
      when last_comma_first_mid
        last_comma_first_mid($~)
      # Comma with lots of lastnames, a first name, optional middle name
      when multi_last_comma
        multi_last_comma($~)
      else 
        if @options[:raise_on_unknown]
          raise UnknownFormat, "Could not parse #{@raw}"
        else
          @matched = :unknown
          false
        end
      end
    end

    alias :first_name :first

    def middle_i
      return nil if middle.nil?
      middle[0,1]
    end
    
    private
    def first_last(match = nil)
      return %r{^(#{first_name_re})\s+(#{last_name_re})$} if match.nil?
      @first, @last = match[1 .. 2]
      @matched = :first_last
    end
    
    def pre_first_last(match = nil)
      return %r{^(#{prefix_re})\s+(#{first_name_re})\s+(#{last_name_re})$} if match.nil?
      @prefix, @first, @last = match[1 .. 3]
      @matched = :pre_first_last
    end

    def pre_first_mid_last(match = nil)
      return %r{^(#{prefix_re})\s+(#{first_name_re})\s+(#{middle_name_re})\s+(#{last_name_re})$} if match.nil?
      @prefix, @first, @middle, @last = match[1 .. 4]
      @matched = :pre_first_mid_last
    end

    def first_mid_last(match = nil)
      return %r{^(#{first_name_re})\s+(#{middle_name_re})\s+(#{last_name_re})$} if match.nil?
      @first, @middle, @last = match[1 .. 3]
      @matched = :first_mid_last
    end

    def last_comma_first_mid(match = nil)
      return %r{^(#{last_name_re}),(?:\s+)?(#{first_name_re})(?:\s+(#{middle_name_re}))?$} if match.nil?
      @first, @last, @middle = match[2], match[1], match[3]
      @matched = :last_comma_first_mid
    end

    def multi_last_comma(match = nil)
      return %r{^((?:#{last_name_re}(?:\s+)?)+),(?:\s+)(#{first_name_re})(?:\s+(#{middle_name_re}))?$} if match.nil?
      @first, @last, @middle = match[2], match[1], match[3]
      @matched = :multi_last_comma
    end

  end
end
