# coding: utf-8
require 'yaml'

require 'pry-man/commands'

module PryMan
  def self.find_docs(pattern)
    docs = YAML.load_file File.dirname(__FILE__) + '/../man.yaml'
    input = docs.map do |k,v|
      if k.match pattern
        item = $1
        item.sub! '⁄', '/' # Had to use Unicode "Fraction Slash" in filename.
        [ item, v ]
      end
    end.compact
    Hash[input.sort]
  end

  @DOCS = {
    'Keyword' => {
      source: 'ruby source, lex.c, circa line 219',
      explanations: find_docs(%r/keywords|(.+)/)
    },
    'Global Variable' => {
      source: 'Started from: http://www.zenspider.com/Languages/Ruby/QuickRef.html#pre-defined-variables',
      explanations: find_docs(%r/globals|(.+)/)
    },
  }


  def self.raw
    @DOCS
  end

  def self.explain(thing)
    @DOCS.each do |label, docs|
      binding.pry
      if explanation = docs[:explanations][thing]
        return Pry::Helpers::Text.yellow(thing) + $/ + explanation
      end
    end
    nil
  end
end
