#
# Config
#
module Config
  SLACK_API_TOKEN = ENV.fetch('SLACK_API_TOKEN')
  TARGET_NAME = ENV.fetch('TARGET_NAME')
  TARGET_CHANNEL = ENV.fetch('TARGET_CHANNEL')
end
