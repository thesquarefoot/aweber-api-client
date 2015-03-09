module Aweber
	module Account

		def all
			get('1.0/accounts/')
		end

		def findSubscribers(account_id, options = {})
			validate_options([:ad_tracking, :area_code, :city, :country, :custom_fields, :dma_code, :email, :last_folloup_message_number_sent, :last_folloup_message_sent_at, :latitude, :longitude, :misc_notes, :name, :postal_code, :region, :status, :subscribed_at, :subscription_method, :unsubscribe_method, :verified_at], options)

			get("1.0/accounts/#{account_id}", {'ws.op' => 'findSubscribers'}.merge(options))
		end

	end
end
