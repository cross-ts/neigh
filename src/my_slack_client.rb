require 'singleton'
#
# HorseとTargetから同じクライアントを使いまわすためのクラス
#
class MySlackClient
  include Singleton

  def initialize
    Slack.configure { |c| c.token = ENV['SLACK_API_TOKEN'] }
    self.auth_test
  end

  def method_missing(method_name, *args)
    client.send(method_name, *args)
  end

  private

  def client
    @client ||= Slack::Web::Client.new
  end
end
