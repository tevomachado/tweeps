require 'rails_helper'

describe HTTPClient do
  it 'authenticates correctly with tweeps website' do
    client = HTTPClient.new
    expect{ client.request_tweets }.to raise_error(TweepsHTTPError)
    expect(client.request_tweets('estevam.souza@locaweb.com.br').class).to eq(Array)
  end

  it 'retrieves tweets array correctly' do
    tweets = HTTPClient.new.request_tweets('estevam.souza@locaweb.com.br')
    expect(tweets.all?{ |tweet| tweet.class == Tweet })
  end
end