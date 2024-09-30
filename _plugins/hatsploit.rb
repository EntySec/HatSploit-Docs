require 'rouge'

module Rouge
  module Tokens
    def self.token(name, shortname, &b)
      tok = Token.make_token(name, shortname, &b)
      const_set(name, tok)
    end

    SHORTNAME = 'z'

    token :Hsf, SHORTNAME do
      token :Prompt, "#{SHORTNAME}p"
      token :Error, "#{SHORTNAME}e"
      token :Good, "#{SHORTNAME}g"
      token :Status, "#{SHORTNAME}s"
      token :Warning, "#{SHORTNAME}w"
      token :Info, "#{SHORTNAME}i"
    end
  end

  module Lexers
    class HatSploitConsoleLanguage < Rouge::RegexLexer
      title 'hsf'
      tag 'hsf'
      desc 'HatSploit/Pwny console highlighter'
      filenames []
      mimetypes []

      def self.keywords
        @keywords ||= Set.new %w()
      end

      state :whitespace do
        rule %r/\s+/, Text
      end

      state :root do
        mixin :whitespace

        rule %r{^(\[hsf\d?)}, Text, :hsf_prompt
        rule %r{^(pwny:)}, Text, :pwny_prompt
        rule %r{^\[-\]}, Tokens::Hsf::Error
        rule %r{^\[\+\]}, Tokens::Hsf::Good
        rule %r{^\[\*\]}, Tokens::Hsf::Status
        rule %r{^\[\!\]}, Tokens::Hsf::Warning
        rule %r{^(\[i\]|\[\?\]|\[>\])}, Tokens::Hsf::Info
        rule %r{.+}, Text
      end

      state :hsf_prompt do
        mixin :whitespace

        rule %r{exploit|auxiliary|post}, Text
        rule %r{:}, Punctuation
        rule %r{\]}, Punctuation
        rule %r{[\w/]+}, Tokens::Hsf::Error
        rule %r{>}, Punctuation, :pop!
      end

      state :pwny_prompt do
        mixin :whitespace

        rule %r{(/[\w/]*)(?=\s)}, Tokens::Hsf::Prompt
        rule %r{(\w+)}, Tokens::Hsf::Status
        rule %r{\$|\#}, Punctuation, :pop!
      end
    end
  end
end