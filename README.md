Slack -> Trello Card Sinatra app
========

#ENV variables

You'll need a .env file created for the [dotenv gem](https://github.com/bkeepers/dotenv). 

It should look like:
```
TRELLO_DEVELOPER_PUBLIC_KEY=your_api_key_here
TRELLO_MEMBER_TOKEN=your_api_key_here
SLACK_WEBHOOK_URL=your_api_key_here
SLACK_WORK_COMMAND_TOKEN=your_api_key_here
```

##Slack ENV keys

For now see [this tutorial](http://www.medivo.com/blog/slack-slash-command-to-trello/) in the Configuring Slack section to see how to setup your SLACK keys. 

##Trello ENV keys

This app uses the `[ruby-trello](https://github.com/jeremytregunna/ruby-trello)` gem for communicating with Trello

1. Get your API keys from [trello.com/app-key](https://trello.com/app-key). The `key` is your TRELLO_DEVELOPER_PUBLIC_KEY for your ENV variables.
2. Visit the URL [trello.com/1/authorize], with the following GET parameters:
    - `key`: the API key you got in step 1.
    - `response_type`: "token"
    - `expiration`: "never" if you don't want your token to ever expire. If you leave this blank,
       your generated token will expire after 30 days.
    - The URL will look like this:
      `https://trello.com/1/authorize?key=YOUR_API_KEY&response_type=token&expiration=never&scope=read,write`
3. You should see a page asking you to authorize your Trello application. Click "allow" and you should see a second page with a long alphanumeric string. This is your TRELLO_MEMBER_TOKEN


