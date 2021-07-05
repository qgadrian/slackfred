require 'slack'
require 'optparse'

Slack.configure do |config|
  config.token = ENV['SLACK_TOKEN']
end

client = Slack::Web::Client.new

text = Slack::Messages::Formatting.unescape(ENV['message'])

client.chat_postMessage(
  channel: ENV['channel'],
  text: text,
  as_user: true
)

puts "Sent message to #{ENV['channel']}"
