module Aweber
	module List

		def lists(account_id)
			get("1.0/accounts/#{account_id}/lists")
		end

		def find_list(account_id, options = {})
			validate_options([:name], options)

			get("1.0/accounts/#{account_id}/lists", {'ws.op' => 'find'}.merge(options))
		end

	end
end
