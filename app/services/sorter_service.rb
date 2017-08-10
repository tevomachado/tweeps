class SorterService
  def self.most_relevant_tweets(tweets)
    sort_by_relevance(get_eligible(tweets))
  end

  def self.most_mentioned_tweets(tweets)
    sort_by_mentions(sort_by_relevance(get_eligible(tweets)))
  end

  private

  def self.get_eligible(tweets)
    tweets.select{ |tweet| tweet.to_locaweb? }
  end

  def self.sort_by_relevance(tweets)
    tweets.sort
  end

  def self.sort_by_mentions(tweets)
    sort_by_relevance(tweets).group_by{ |tweet| tweet.screen_name }
  end
end