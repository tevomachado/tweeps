class SorterService
  def self.most_relevant(tweets)
    find_eligible(tweets).sort
  end

  def self.most_mentioned(tweets)
    most_relevant(tweets).group_by{ |tweet| tweet.screen_name }
  end

  private

  def self.find_eligible(tweets)
    tweets.select{ |tweet| tweet.to_locaweb? }
  end
end
