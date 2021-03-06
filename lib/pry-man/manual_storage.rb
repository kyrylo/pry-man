# coding: utf-8

module PryMan
  class ManualStorage
    attr_reader :mans

    def initialize(src)
      @mans = Hash.new { |h, k| h[k] = [] }

      YAML.load_file(src).map do |k, v|
        match = k.match(/^(keywords|globals|constants|pry)\|(.+)\z/)
        next unless match
        name = if match[2] == "$⁄"
                 match[2].sub!('⁄', '/') # To support the $/ global
               else
                 match[2]
               end
        @mans[match[1]] << [name, v]
      end
    end

    def man_for(term)
      item = nil

      category = @mans.find do |_category, items|
        item = items.find { |name, desc| name == term }
      end

      if category && item
        [category.first, item]
      end
    end
  end
end
