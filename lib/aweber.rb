require 'aweber/client'
require 'aweber/config'

module Aweber

	autoload :VERSION, File.join(File.dirname(__FILE__), 'aweber/version')

	extend Config

	class << self
		def new(options={})
			Aweber::Client.new(options)
		end
	end

end
