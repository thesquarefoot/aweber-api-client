module Aweber
	module Subscriber

		def subscribers(account_id, list_id)
			get("1.0/accounts/#{account_id}/lists/#{list_id}/subscribers")
		end

		def find_subscribers(account_id, options = {})
			if ( !options[:list_id].nil? ) 
				list_id = options[:list_id]
				options.delete :list_id
			end

			validate_options([:ad_tracking, :area_code, :city, :country, :custom_fields, :dma_code, :email, :last_folloup_message_number_sent, :last_folloup_message_sent_at, :latitude, :longitude, :misc_notes, :name, :postal_code, :region, :status, :subscribed_at, :subscription_method, :unsubscribe_method, :verified_at], options)

			if list_id.nil?
				get("1.0/accounts/#{account_id}", {'ws.op' => 'findSubscribers'}.merge(options))
			else
				get("1.0/accounts/#{account_id}/lists/#{list_id}/subscribers", {'ws.op' => 'find'}.merge(options))
			end
		end

		def create_subscriber(account_id, list_id, options = {})
			validate_options([:ad_tracking, :custom_fields, :email, :ip_address, :last_folloup_message_number_sent, :misc_notes, :name], options)

			post("1.0/accounts/#{account_id}/lists/#{list_id}/subscribers", {'ws.op' => 'create'}.merge(options))
		end

		def move_subscriber(account_id, list_id, subscriber_id, options = {})
			if ( !options[:list_id].nil? )
				options[:list_link] = list_link(account_id, options[:list_id])
				options.delete :list_id
			end

			validate_options([:last_followup_message_number_sent, :list_link], options)

			post("1.0/accounts/#{account_id}/lists/#{list_id}/subscribers/#{subscriber_id}", {'ws.op' => 'move'}.merge(options))
		end

		def archive_subscriber(account_id, list_id, subscriber_id)
			post("1.0/accounts/#{account_id}/lists/#{list_id}/subscribers/#{subscriber_id}", {'ws.op' => 'archive'})
		end

		def update_subscriber(account_id, list_id, subscriber_id, options = {})
			validate_options([:ad_tracking, :email, :last_folloup_message_number_sent, :misc_notes, :name, :status], options)

			patch("1.0/accounts/#{account_id}/lists/#{list_id}/subscribers/#{subscriber_id}", options)
		end

	end
end
