module Aweber
	module Subscriber

		def all(account_id, list_id)
			get("1.0/accounts/#{account_id}/lists/#{list_id}/subscribers")
		end

		def find(account_id, list_id, options)
			validate_options([:ad_tracking, :area_code, :city, :country, :custom_fields, :dma_code, :email, :last_folloup_message_number_sent, :last_folloup_message_sent_at, :latitude, :longitude, :misc_notes, :name, :postal_code, :region, :status, :subscribed_at, :subscription_method, :unsubscribe_method, :verified_at], options)

			get("1.0/accounts/#{account_id}/lists/#{list_id}/subscribers", {'ws.op' => 'find'}.merge(options))
		end

		def create(account_id, list_id, options)
			validate_options([:ad_tracking, :custom_fields, :email, :ip_address, :last_folloup_message_number_sent, :misc_notes, :name], options)

			post("1.0/accounts/#{account_id}/lists/#{list_id}/subscribers", {'ws.op' => 'create'}.merge(options))
		end

		def move(account_id, list_id, subscriber_id, options)
			validate_options([:last_followup_message_number_sent, :list_link], options)

			post("1.0/accounts/#{account_id}/lists/#{list_id}/subscribers/#{subscriber_id}", {'ws.op' => 'move'}.merge(options))
		end

		def archive(account_id, list_id, subscriber_id)
			post("1.0/accounts/#{account_id}/lists/#{list_id}/subscribers/#{subscriber_id}", {'ws.op' => 'archive'})
		end

	end
end
