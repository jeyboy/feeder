class FeedsController < ApplicationController
  before_filter :proc_list, :only => :show

  def index

  end

  def show
    @feeds = FeedEntry.parse(FEEDS[params[:feed][:name]])
  end

private
  def proc_list
    redirect_to :root if FEEDS[params[:feed][:name]].blank?
  end
end
