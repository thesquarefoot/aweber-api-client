module Aweber
	module Helper

		private

		def validate_options(valid_opts, opts)
			bad_opts = opts.select { |val| !valid_opts.include?(val) }

			if bad_opts.any?
				raise ArgumentError.new "Invalid options (#{bad_opts.keys.join(', ')}) passed, only #{valid_opts} allowed."
			end
		end
	end
end
