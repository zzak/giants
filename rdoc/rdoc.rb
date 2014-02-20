require 'rdoc'

class Markdown
  attr_accessor :text, :option, :parser, :formatter

  def initialize(text)
    @text = text
    @options = RDoc::Options.new
    @parser = RDoc::Markdown.new
  end

  def to_html
    @formatter = RDoc::Markup::ToHtml.new(@options, nil)
    @parser.parse(@text).accept(@formatter)
  end
end

markdown = Markdown.new $stdin.read
puts markdown.to_html
