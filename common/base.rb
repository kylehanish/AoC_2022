class Base
    def initialize(args)
        args.each { |k,v| instance_variable_set("@#{k}", v)}
    end
end

module Input
    def self.get_file_lines(filename = './input.txt')
        file(filename)&.readlines(chomp:true) || []
    end

    def self.file(filename)
        @file ||= File.new(file_path(filename))
    end

    def self.file_path(filename)
        File.join(root_path, filename)
    end

    def self.root_path
        Dir.pwd
    end
end

class NilClass
    def blank?
      true
    end
  end
  
  class FalseClass
    def blank?
      true
    end
  end
  
  class TrueClass
    def blank?
      false
    end
  end
  
  class Object
    def blank?
      respond_to?(:empty?) ? empty? : !self
    end
  end
  
  class String
    BLANK_RE = /\A[[:space:]]*\z/
  
    # A string is blank if it's empty or contains whitespaces only:
    #
    #   ''.blank?       # => true
    #   '   '.blank?    # => true
    #   "\t\n\r".blank? # => true
    #   ' blah '.blank? # => false
    #
    # Unicode whitespace is supported:
    #
    #   "\u00a0".blank? # => true
    #
    def blank?
      # The regexp that matches blank strings is expensive. For the case of empty
      # strings we can speed up this method (~3.5x) with an empty? call. The
      # penalty for the rest of strings is marginal.
      empty? || BLANK_RE.match?(self)
    end
  end