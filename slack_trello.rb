require 'bundler/setup'
require 'sinatra'
require 'dotenv'
Dotenv.load
require 'json'
require 'slack_trello'

class SlackTrelloApp < Sinatra::Application

  #TODO: need to sort out whether to do auth in class or in request
  before do
    return 401 unless WHITELIST_TOKENS.include?(request["token"])
  end

  WHITELIST_TOKENS = [
    ENV["SLACK_CARD_COMMAND_TOKEN"]
  ]

  def work
    return response = SlackTrello::WorkCommand.new(params, ENV["SLACK_WEBHOOK_URL"]).run
    # TODO:format like sinatra
    # render text: response
  end
  
  post '/bug' do
    return work.to_json
  end

  get '/' do
    "hello world"
  end

end

