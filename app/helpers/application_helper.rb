module ApplicationHelper
  def logged_in?
    false # TODO
  end

  def is_admin?
    false # TODO
  end


  def format_post_text(text)
    parsed = text

    # Parse wikilinks
    parsed.gsub!( /\[\[(.+)\]\]/, link_to('WIKILINK', "/$1") )

    # Expand images (ends with jpg/gif/png)
    # TODO

    # Expand videos (youtube.com/vimeo.com links)
    # TODO

    # Humanize & strip escaped HTML
    parsed = parsed.humanize

    return parsed
  end
end
