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
      /\w[-.'\w]+/
    end

    def parse
      case @raw_name
      # just "Firstname Lastname"
      when /^(#{first_name_re})\s+(#{last_name_re})$/
        @first, @last = $1, $2
      # just "Lastname, Firstname"
      when /^(#{last_name_re}),(?:\s+)?(#{first_name_re})$/
        @first, @last = $2, $1
      when /^(#{prefix_re})\s+(\w+)\s+(\w+)$/
        @prefix, @first, @last = $1, $2, $3
      else 
        raise Error, "Could not parse #{@raw_name}"
      end
    end

    alias :first_name :first

  end
end
