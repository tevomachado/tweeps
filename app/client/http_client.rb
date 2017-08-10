class TweepsHTTPError < StandardError
  def initialize(http_code)
    msg = "Tweeps HTTP Error: #{http_code}"
    msg << ". Username header required for authentication"
    super(msg)
  end
end

class HTTPClient
  TWEEPS_PATH = "http://tweeps.locaweb.com.br/tweeps"

  def request_tweets(username = nil)
    response = HTTParty.get(TWEEPS_PATH, headers: {Username: username})
    if response.ok?
      JSON.parse(response.body)['statuses'].map do |tweet_hash|
        Tweet.new(tweet_hash)
      end
    else
      raise TweepsHTTPError.new(response.code)
    end
  end
end
