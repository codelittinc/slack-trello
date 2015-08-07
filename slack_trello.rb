require 'bundler/setup'
require 'sinatra'
require 'dotenv'
Dotenv.load
require 'json'
require 'slack_trello'

class SlackTrelloApp < Sinatra::Application

  #TODO: Need to test this
  before do
    error 401 unless WHITELIST_TOKENS.include?(params[:token])
  end

  WHITELIST_TOKENS = [
    ENV["SLACK_WORK_COMMAND_TOKEN"]
  ]

  def work
    return response = SlackTrello::WorkCommand.new(params, ENV["SLACK_WEBHOOK_URL"]).run
  end
  
  post '/bug' do
    return work.to_json
  end
end

