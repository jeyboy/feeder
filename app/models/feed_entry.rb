class FeedEntry < ActiveRecord::Base
  attr_accessible :fields, :guid
  serialize :fields, Hash

  def self.parse(params)
    params['additional'].to_s.split(' ').each {|v| Feedzirra::Feed.add_common_feed_entry_element(v, :as => v.gsub(/:/, "_"))}
    proceed(Feedzirra::Feed.fetch_and_parse(params['url']).entries)
  end

  def self.proceed(entries)
    entries.map do |entry|
      self.where(:guid => entry.id).first_or_create do |obj|
        obj.fields = entry.instance_values.except("entry_id")
      end
    end
  end
end
