module ApplicationHelper
  def print_feed(feed)
    hash = feed.fields
    url = hash.delete('url')
    title = hash.delete('title')
    date = hash.delete('published')

    raw <<-EOF
      <div>
        <p>(#{date}) #{link_to_if url.present?, title, url}</p>
        #{hash.map {|k, v| proceed_elem(k, v) }.join}
      </div>
    EOF
  end

private
  def proceed_elem(key, value)
    if (value.is_a?(Array))
      <<-EOF
        <p>#{key}
          <ul>#{value.map {|child| "<li>#{child}</li>"}.join}</ul>
        </p>
      EOF
    else
      "<p>#{key} : #{value}</p>"
    end
  end
end
