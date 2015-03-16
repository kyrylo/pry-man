module PryMan
  Command = Class.new
  STORAGE = PryMan::ManualStorage.new(
    File.join(File.dirname(__FILE__), '..', '..', 'man.yaml')
  )

  class Command::ShowDoc < Pry::ClassCommand
    match 'show-doc'
    group 'Introspection'
    description 'Show the documentation for a method, class, keyword or global variable.'

    banner <<-BANNER
      Usage:   show-doc [OPTIONS] [METH]
      Aliases: ?

      Show the documentation for a method or class. Tries instance methods first and
      then methods by default.

      show-doc hi_method # docs for hi_method
      show-doc Pry       # for Pry class
      show-doc Pry -a    # for all definitions of Pry class (all monkey patches)
      show-doc $!        # for a global variable
      show-doc alias     # for a keyword
    BANNER

    ORIGINAL_SHOW_DOC = Pry.commands['show-doc']

    include Pry::Helpers::DocumentationHelpers

    def process(term)
      if args.any? && (man = extract_man(term)) && man
        _pry_.pager.page(man)
      else
        ORIGINAL_SHOW_DOC.new(context).call_safely(term)
      end
    end

    def extract_man(term)
      if man = STORAGE.man_for(term)
        title = Pry::Helpers::Text.yellow("\n#{man.last.first} (#{man.first})\n--\n")
        description = process_comment_markup(man.last.last)
        title + description
      end
    end
  end

  class Command::Man < Pry::ClassCommand
    match 'mans'
    description 'List all man pages'

    def process
      out = STORAGE.mans.map do |category, items|
        heading = Pry::Helpers::Text.send(_pry_.config.ls.heading_color, category)
        Pry::Helpers.tablify_or_one_line(heading, items.sort.map(&:first))
      end

      _pry_.pager.page(out.join(""))
    end
  end

  Pry::Commands.add_command(PryMan::Command::ShowDoc)
  Pry::Commands.add_command(PryMan::Command::Man)
end
