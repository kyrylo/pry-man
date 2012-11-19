# encoding: utf-8
require 'pry'
class Pry
  class Docmore
    def self.find_docs pattern
      path = File.dirname(__FILE__) + '/../pry-docmore.wiki/*.md'
      input = Dir[path].map do |file_name|
        if file_name.match pattern
          item = $1
          item.sub! '⁄', '/' # Had to use Unicode "Fraction Slash" in filename.
          [ item, File.read(file_name) ]
        end
      end.compact
      Hash[input]
    end
    @DOCS = {
      'Keyword' => {
        source: 'ruby source, lex.c, circa line 219',
        explanations: find_docs(%r/Ruby Keyword: (.+)\.md/)
      },
      'Global Variable' => {
        source: 'Started from: http://www.zenspider.com/Languages/Ruby/QuickRef.html#pre-defined-variables',
        explanations: find_docs(%r/Ruby Global (\S+)/)
      },
    }
    def self.raw; @DOCS end
    def self.explain thing
      @DOCS.each do |label, docs|
        # TODO: colored label
        return docs[:explanations][thing] if docs[:explanations].has_key? thing
      end
      nil
    end

    ORIGINAL_SHOW_DOC ||= Pry.commands['show-doc']
    Pry::Commands.create_command 'show-doc' do
      description 'Show the documentation for a method/class/keyword/global. Aliases: ?'
      command_options \
        :shellwords => false,
        :keep_retval => false
      def process arg_string
        if docmore = Pry::Docmore.explain(arg_string)
          _pry_.output.puts docmore
          $/
        else
          ORIGINAL_SHOW_DOC.new(context).call_safely(arg_string)
        end
      end
    end
    Pry::Commands.create_command 'show-docmores' do
      description 'List keywords and vars covered by pry-docmore'
      def process
        Pry::Docmore.raw.each do |label, docs|
          # Pry needs a general mechanism to columnize things, and when it gets
          # one, this can use it:
          _pry_.output.puts "#{label}s".yellow + ': ' +
            docs[:explanations].keys.join(' ')
        end
      end
    end

  end
end
