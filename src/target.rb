require_relative 'config'
require_relative 'my_slack_client'

#
# ヒヒーン:horse:するターゲットを選択するクラス
#
class Target
  def name
    Config::TARGET_NAME
  end

  def channel
    Config::TARGET_CHANNEL
  end

  def thread_ts
    thread.ts
  end

  def thread
    history.messages.find do |message|
      message.user == user.id
    end
  end

  def user_id
    user.id
  end

  def user
    @user ||= MySlackClient.instance.users_info(user: name).user
  end

  # TODO: count: 1000ではなくデフォの100を使う
  #       見つからなかったら次のループに
  def history
    @history ||= MySlackClient.instance.channels_history(channel: channel, count: 1000)
  end
end
