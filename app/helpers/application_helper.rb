module ApplicationHelper
  def logged_in?
    false # TODO
  end

  def is_admin?
    false # TODO
  end


  def format_post_text(text)

    # Fully escape & strip HTML
    # parsed = text.humanize
    parsed = strip_tags(text)

    # Parse entrylinks
    regex = /\[\[(.+)\]\]/
    if parsed =~ regex
      parsed = parsed.gsub(regex, "<a href=\"/entries/#{$1}\">#{$1}</a>")
    end

    # Expand images (ends with jpg/gif/png)
    # TODO

    # Expand videos (youtube.com/vimeo.com links)
    # TODO

    return parsed
  end
end
