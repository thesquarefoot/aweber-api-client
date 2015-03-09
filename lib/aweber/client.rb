require 'aweber/helpers'
require 'aweber/account'
require 'aweber/list'
require 'aweber/subscriber'
require 'aweber/request'
require 'aweber/connection'

module Aweber
	class Client

		class << self
			def default_api_host
				'api.aweber.com'
			end
		end

		include Aweber::Helpers
		include Aweber::Request
		include Aweber::Account
		include Aweber::List
		include Aweber::Subscriber
		include Aweber::Connection

		def initialize(attrs= {})
			attrs = Aweber.options.merge(attrs)
			Config::VALID_OPTIONS_KEYS.each do |key|
				instance_variable_set("@#{key}".to_sym, attrs[key])
			end
		end

		def api_host
			self.class.default_api_host
		end

		def api_scheme
			@api_scheme || 'https'
		end

		def credentials
			{
				:consumer_key => @consumer_key,
				:consumer_secret => @consumer_secret,
				:token => @oauth_token,
				:token_secret => @oauth_token_secret
			}
		end

	end
end
