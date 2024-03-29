# Example:
# {% youtube http://www.youtube.com/watch?v=Awf45u6zrP0 %}

require 'cgi'
require 'uri'

module Jekyll
  class Youtube < Liquid::Tag
    @width = 640
    @height = 390

    def initialize(name, id, tokens)
      super
      if id.to_s.start_with? 'http'
        @id = CGI.parse(URI.parse(id.to_s).query)['v'][0]
      else
        @id = id
      end
    end

    def render(context)
      %(<iframe class="youtube-embedded-video" width="640px" height="390px" src="http://www.youtube.com/embed/#{@id}" frameborder="0" webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe>)
    end
  end
end

Liquid::Template.register_tag('youtube', Jekyll::Youtube)
