require 'bundler/setup'
require 'sinatra'
require 'dotenv'
Dotenv.load
require 'json'


class SlackCommands

  #TODO: need to sort out whether to do auth in class or in request
  #before do
  #  :slash_command_auth
  #end

  WHITELIST_TOKENS = [
    ENV["SLACK_CARD_COMMAND_TOKEN"]
  ]

  def card
    response = SlackTrello::CardCommand.new(params, ENV["SLACK_WEBHOOK_URL"]).run
    render text: response
  end

  private 

  def slash_command_auth
    #unless WHITELIST_TOKENS.include?(params[:token])
      #render text: "Unauthorized", status: :unauthorized
    #end
  end

end
