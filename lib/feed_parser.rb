class FeedParser
  require 'lib/feedzirra/parser/rss_entry'

  def self.parse(uri, fields = nil)
    Feedzirra::Feed.add_common_feed_elements(fields)

    feeds = Feedzirra::Feed.fetch_and_parse(uri)
    @@keys = feeds.keys
    @@entries = feeds.entries
  end
end