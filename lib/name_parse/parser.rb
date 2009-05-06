module NameParse
  class Parser
    attr_reader :first, :last, :suffix, :prefix, :middle
    def initialize(name_string)
      @raw_name = name_string
      parse
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
    
    def parse
      case @raw_name
      # just "Firstname Lastname"
      when /^(#{first_name_re})\s+(#{last_name_re})$/
        @first, @last = $1, $2
      # Catch names with prefixes, no comma
      when /^(#{prefix_re})\s+(#{first_name_re})\s+(#{last_name_re})$/
        @prefix, @first, @last = $1, $2, $3
      # just "Firstname Middle Lastname"
      when /^(#{first_name_re})\s+(#{middle_name_re})\s+(#{last_name_re})$/
        @first, @middle, @last = $1, $2, $3
      # just "Lastname, Firstname (Middle)" middle is optional
      when /^(#{last_name_re}),(?:\s+)?(#{first_name_re})(?:\s+(#{middle_name_re}))?$/
        @first, @last, @middle = $2, $1, $3
      when /^(#{prefix_re})\s+(#{first_name_re})\s+(#{middle_name_re})\s+(#{last_name_re})$/
        @prefix, @first, @last = $1, $2, $3
      # just "Firstname Middle Lastname"
      else 
        raise UnknownFormat, "Could not parse #{@raw_name}"
      end
    end

    alias :first_name :first

  end
end
