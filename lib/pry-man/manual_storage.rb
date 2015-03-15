module PryMan
  class ManualStorage
    attr_reader :mans

    def initialize(src)
      @mans = Hash.new { |h, k| h[k] = [] }

      YAML.load_file(src).map do |k, v|
        match = k.match(/^(keywords|globals)\|(.+)\z/)
        next unless match
        @mans[match[1]] << [match[2], v]
      end
    end

    def man_for(term)
      @mans.find { |_category, man| man.first == term }
    end
  end
end
