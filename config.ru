root_dir = File.dirname(__FILE__)
app_file = File.join(root_dir, 'slack_trello.rb')
require app_file
require 'trello'

Trello.configure do |config|
  config.developer_public_key = ENV['TRELLO_DEVELOPER_PUBLIC_KEY']
  config.member_token = ENV['TRELLO_MEMBER_TOKEN']
end

run SlackTrelloApp
