require 'slack-ruby-client'

require_relative 'config'
require_relative 'my_slack_client'

#
# This is Horse
#
class Horse
  class << self
    def neigh
      new.neigh
    end
  end

  def neigh
    MySlackClient.instance.chat_postMessage(
      channel: '#memo',
      text: "#{message}",
      reply_broadcast: true
    )
  end

  private

  def message
    'ヒヒーン:horse:'
  end
end
