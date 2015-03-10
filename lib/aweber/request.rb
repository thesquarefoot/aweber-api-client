require 'json'

module Aweber
	module Request

		# Performs a get request
		def get(path, params = {})
			response = connection.get do |req|
				req.url path
				req.params = params
			end

			respond(response)
		end

		# Performs post request
		def post(path, params={})
			response = connection.post do |req|
				req.url path
				req.body = params unless params.empty?
			end

			respond(response)
		end

		# Performs patch request
		def patch(path, params={})
			response = connection.patch do |req|
				req.headers[:content_type] = 'application/json'
				req.url path
				req.body = JSON.generate(params) unless params.empty?
			end

			respond(response)
		end

		def respond(response)
			response.body
		end

	end
end
