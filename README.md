Slack -> Trello Card Sinatra app
========

The Slack->Trello Sinatra app responds to Trello POST requests and creates Trello cards.

It is very much based on the previous work done by [MrPowers](https://github.com/MrPowers) in his [slack-responder](https://github.com/medivo/slack-responder) app and his gem [slack_responder](https://github.com/MrPowers/slack_trello) gem. 

I started this to simplify the application down to the barebones and also provide a Docker deployment that makes things easy for others. 

#ENV variables

##Development/Testing

You'll need a .env file created for the [dotenv gem](https://github.com/bkeepers/dotenv). 

It should look like:
```
TRELLO_DEVELOPER_PUBLIC_KEY=your_api_key_here
TRELLO_MEMBER_TOKEN=your_api_key_here
SLACK_WEBHOOK_URL=your_api_key_here
SLACK_WORK_COMMAND_TOKEN=your_api_key_here
```

##Production

Productions keys are stored in the prod_server.sh.example. You'll need to change the keys to match yours and also remove the example extension. (`mv prod_server.sh.example prod_server.sh`)

##Slack ENV keys

For now see [this tutorial](http://www.medivo.com/blog/slack-slash-command-to-trello/) from [MrPowers](https://github.com/MrPowers) in the Configuring Slack section to see how to setup your SLACK keys. 

##Trello ENV keys

This app uses the [`ruby-trello`](https://github.com/jeremytregunna/ruby-trello) gem for communicating with Trello

1. Get your API keys from [trello.com/app-key](https://trello.com/app-key). The `key` is your TRELLO_DEVELOPER_PUBLIC_KEY for your ENV variables.
2. Visit the URL [trello.com/1/authorize], with the following GET parameters:
    - `key`: the API key you got in step 1.
    - `response_type`: "token"
    - `expiration`: "never" if you don't want your token to ever expire. If you leave this blank,
       your generated token will expire after 30 days.
    - The URL will look like this:
      `https://trello.com/1/authorize?key=YOUR_API_KEY&response_type=token&expiration=never&scope=read,write`
3. You should see a page asking you to authorize your Trello application. Click "allow" and you should see a second page with a long alphanumeric string. This is your TRELLO_MEMBER_TOKEN

#Deployment

1. Change the `SERVER_IP` in prod.sh. #TODO: Make this an ENV variable
2. Change the keys in the prod_server.sh
3. Change the registry for docker in `prod.sh` to your registry.
3. Run `./prod.sh`
4. Rember to fix your Slash command url that I'm sure you've been testing with once deployed. 

#Contributing

##How to

1. Fork the repo and clone it.

2. Make your changes in a new git branch:

   `git checkout -b my-fix-branch master`

3. Create your patch, including appropriate test cases making sure they
   pass.

4. Push your branch to GitHub:

   `git push origin my-fix-branch`

5. In GitHub, send a pull request to `slack-trello:master`.


##Contributors

- [codelitt](https://github.com/codelitt)
- [MrPowers](https://github.com/MrPowers)
