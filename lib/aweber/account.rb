module Aweber
	module Account

		def accounts
			get('1.0/accounts/')
		end

	end
end
