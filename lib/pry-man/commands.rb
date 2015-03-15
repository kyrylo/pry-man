module PryMan
  Command = Class.new
  ORIG_SHOW_DOC = Pry.commands['show-doc']

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

    def process(arg_string)
      if man = PryMan.explain(arg_string)
        _pry_.output.puts(man)
      else
        ORIG_SHOW_DOC.new(context).call_safely(arg_string)
      end
    end
  end

  class Command::Mans < Pry::ClassCommand
    match 'mans'
    description 'List all manual pages'

    def process
      PryMan.raw.each do |label, docs|
        _pry_.output.puts Pry::Helpers::Text.yellow("#{label}s") + ': ' +
                        docs[:explanations].keys.join(' ')
      end
    end
  end

  Pry::Commands.add_command(PryMan::Command::ShowDoc)
  Pry::Commands.add_command(PryMan::Command::Mans)
end
