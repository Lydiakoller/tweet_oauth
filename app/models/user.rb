class User < ActiveRecord::Base
  validates :username, :uniqueness => true

  has_many :tweets

  def tweet(text)
    tweet = tweets.create!(:text => text)

    p TweetWorker.perform_async(tweet.id)


  end
end
