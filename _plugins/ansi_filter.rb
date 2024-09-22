require 'ansi-to-html'

module Jekyll
  module AnsiToHtmlFilter
    def ansi_to_html(input)
      converter = AnsiToHtml.new
      converter.render(input)
    end
  end
end

Liquid::Template.register_filter(Jekyll::AnsiToHtmlFilter)
