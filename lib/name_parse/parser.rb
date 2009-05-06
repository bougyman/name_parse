module NameParse
  class Parser
    attr_reader :first, :last, :suffix, :prefix, :middle, :raw

    def initialize(name_string = nil)
      @raw = name_string
      parse(@raw) if @raw
    end

    def prefix_re
      /(?:dr|mrs?|ms|miss|mister|sgt|cpt|cpl)\.?/i
    end

    def first_name_re
      /\w[-.'\w]+/
    end

    def last_name_re
      /(?:(?:v[ao]n(?:\s+der?)?|de\s+la)\s+)?\w[-.'\w]+/i
    end

    def middle_name_re
      /\w(?:\.|[-.'\w]+)?/
    end

    def middle_i
      return nil if middle.nil?
      middle[0,1]
    end
    
    def parse(name)
      case name
      # just "Firstname Lastname"
      when /^(#{first_name_re})\s+(#{last_name_re})$/
        @first, @last = $1, $2
        @matched = :first_last
      # Catch names with prefixes, no comma
      when /^(#{prefix_re})\s+(#{first_name_re})\s+(#{last_name_re})$/
        @prefix, @first, @last = $1, $2, $3
        @matched = :pre_first_last
      # Catch names with prefixes and middle names, no comma
      when /^(#{prefix_re})\s+(#{first_name_re})\s+(#{middle_name_re})\s+(#{last_name_re})$/
        @prefix, @first, @middle, @last = $1, $2, $3, $4
        @matched = :pre_first_mid_last
      # just "Firstname Middle Lastname"
      when /^(#{first_name_re})\s+(#{middle_name_re})\s+(#{last_name_re})$/
        @first, @middle, @last = $1, $2, $3
        @matched = :first_mid_last
      # just "Lastname, Firstname (Middle)" middle is optional
      when /^(#{last_name_re}),(?:\s+)?(#{first_name_re})(?:\s+(#{middle_name_re}))?$/
        @first, @last, @middle = $2, $1, $3
        @matched = :last_comma_first_mid
      else 
        raise UnknownFormat, "Could not parse #{@raw_name}"
      end
    end

    alias :first_name :first

  end
end
