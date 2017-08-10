class TweepsService
  def find_tweets
    HTTPClient.new.request_tweets('estevam.souza@locaweb.com.br')
  end

  def find_most_relevants
    SorterService.most_relevant(find_tweets)
  end

  def find_most_mentions
    SorterService.most_mentioned(find_tweets)
  end
end
