require 'bundler/setup'
require 'sinatra'
require 'dotenv'
Dotenv.load
require 'json'
require 'slack_trello'

class SlackTrelloApp < Sinatra::Application

  #TODO: Need to test this
  before do
    return 401 unless WHITELIST_TOKENS.include?(request["token"])
  end

  WHITELIST_TOKENS = [
    ENV["SLACK_CARD_COMMAND_TOKEN"]
  ]

  def work
    return response = SlackTrello::WorkCommand.new(params, ENV["SLACK_WEBHOOK_URL"]).run
  end
  
  post '/bug' do
    return work.to_json
  end
end

