require 'slack-ruby-client'

#
# This is Horse
#
class Horse
  class << self
    def neigh
      new.neigh
    end
  end

  def initialize
    Slack.configure { |c| c.token = ENV['SLACK_API_TOKEN'] }
  end

  def neigh
    client.chat_postMessage(channel: '#qiita', text: message)
  end

  private

  def client
    @client ||= Slack::Web::Client.new
  end

  def message
    'ヒヒーン:horse:'
  end
end
