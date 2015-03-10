# Aweber

A Ruby wrapper for the Aweber REST API.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'aweber'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install aweber

## Usage

**NOTE:** This gem will not perform a three legged OAuth request for you.

### Configuration

    Aweber.configure do |config|
    	config.consumer_key = "consumer_key"
    	config.consumer_secret = "consumer_secret"
    	config.oauth_token = "access_token"
    	config.oauth_token_secret = "access_token_secret"
	end

### Initialization

For the purposes of this README, we'll assume the client has been initialized as `client`.

    client = Aweber::Client.new

### Accounts

#### Get All Accounts

Get a collection of customer accounts associated with the provided OAuth access token and secret that have authorized your AWeber app. An `id` for an account in this response is required for all other endpoints.

    client.accounts

### Lists

#### Get All Lists

Get a collection of all subscriber lists associated with the provided `account_id`.

    client.lists(account_id)

#### Find List

Find a list based on the list name or the unique list id of the list. Refer to the [Aweber documentation](https://labs.aweber.com/docs/reference/1.0#list_collection) for more information.

    client.find_list(account_id, options = {})

### Subscribers

#### Get All List Subscribers

Get a collection of all subscribers associated with the provided `list_id`.

    client.subscribers(account_id, list_id)

#### Find Subscribers

Find subscribers based on provided search parameters. Refer to the [Aweber documentation](https://labs.aweber.com/docs/reference/1.0#account_entry) for more information.

**NOTE:** Passing a `list_id` in the `options` parameter will limit the search the provided list.

    client.find_subscribers(account_id, options = {})

#### Create Subscriber

Add a subscriber to a provided list. Refer to the [Aweber documentation](https://labs.aweber.com/docs/reference/1.0#subscriber_entry) for more information.

    client.create_subscriber(account_id, list_id, options = {})

#### Move Subscriber

Move a subscriber from one list to another. Refer to the [Aweber documentation](https://labs.aweber.com/docs/reference/1.0#subscriber_entry) for more information.

**NOTE:** Passing a `list_id` in the `options` parameter will act as a shortcut to automatically inject the required `list_link` parameter.

    client.move_subscriber(account_id, list_id, subscriber_id, options = {})

#### Archive Subscriber

Archive a subscriber from a provided list. Refer to the [Aweber documentation](https://labs.aweber.com/docs/reference/1.0#subscriber_entry) for more information.

    client.archive_subscriber(account_id, list_id, subscriber_id)

## Contributing

1. Fork it ( https://github.com/[my-github-username]/aweber/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
