module Aweber
	module Helper

		private

		def validate_options(valid_opts, opts)
			valid_opts.symbolize_keys!
			opts.symbolize_keys!

			bad_opts = opts.select { |val| !valid_opts.include?(val) }

			if bad_opts.any?
				raise ArgumentError.new "Invalid options (#{bad_opts.keys.join(', ')}) passed, only #{valid_opts} allowed."
			end

			if opts[:custom_fields].is_a?(Hash)
				opts[:custom_fields] = opts[:custom_fields].to_json
			end
		end

		def list_link(account_id, list_id)
			"#{api_scheme}://#{api_host}/1.0/accounts/#{account_id}/lists/#{list_id}"
		end
	end
end
