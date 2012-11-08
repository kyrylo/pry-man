# encoding: utf-8
require 'pry'
class Pry
  class Docmore
    Pry.commands.command '/?' do
      Pry.output.puts Pry::Docmore.explain arg_string.strip
      prev = Pry.commands.entries.find do |cmd, inst| cmd == 'show-doc' end[1]
      p prev
      blk = prev.instance_variable_get :@block
      p blk
      blk.call arg_string
    end

    Pry.commands.command ',?', 'Doc more — see global/keyword info' do
    end
    def self.find_docs pattern
      input = Dir['pry-docmore.wiki/*.md'].map do |file_name|
        if file_name.match pattern
          item = $1
          item.sub! '⁄', '/' # Had to use Unicode "Fraction Slash" in filename.
          [ item, File.read(file_name) ]
        end
      end.compact
      Hash[input]
    end
    @DOCS = [
      {
        label: 'Keyword',
        source: 'ruby source, lex.c, circa line 219',
        explanations: find_docs(%r/Ruby Keyword: (.+)\.md/)
      },
      {
        label: 'Global Variable',
        source: 'Started from: http://www.zenspider.com/Languages/Ruby/QuickRef.html#pre-defined-variables',
        explanations: find_docs(%r/Ruby Global (\S+)/)
      },
    ]
    def self.explain thing
      @DOCS.each do |kind|
        return kind[:explanations][thing] if kind[:explanations].has_key? thing
      end
      nil
    end
  end
end
