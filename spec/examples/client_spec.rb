require 'spec_helper'

describe Aweber::Client do

	context 'when using the generic copy' do

		before do
			@key = 'thekey'
			Aweber.configure do |c|
				c.consumer_key = @key
			end
		end

		it 'should give new clients those credentials' do
			client = Aweber::Client.new
			expect(client.credentials[:consumer_key]).to eq(@key)
		end

		it 'should have it\'s own credentials' do
			expect(Aweber.credentials[:consumer_key]).to eq(@key)
		end

		it 'should be able to make a new client (using these credentials)' do
			expect(Aweber.new).to be_a(Aweber::Client)
			expect(Aweber.new.credentials[:consumer_key]).to eq(@key)
		end

	end

	context 'when using custom copies of the client' do

		before do
			@client1 = Aweber::Client.new(:consumer_key => 'key1')
			@client2 = Aweber::Client.new(:consumer_key => 'key2')
		end

		it 'should keep them separate' do
			expect([
				@client1.credentials[:consumer_key],
				@client2.credentials[:consumer_key]
			].uniq.count).to eq(2)
		end

	end

	describe :api_scheme do

		it 'defaults to https' do
			expect(Aweber::Client.new.api_scheme).to eq('https')
		end

		it 'can be set by the initializer' do
			client = Aweber::Client.new(:api_scheme => 'http')
			expect(client.api_scheme).to eq('http')
		end

		it 'can be set globally' do
			Aweber.configure do |c|
				c.api_scheme = 'http'
			end
			expect(Aweber::Client.new.api_scheme).to eq('http')
		end

	end

end
