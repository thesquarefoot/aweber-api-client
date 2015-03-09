require 'spec_helper'

describe Aweber::Request do

	let(:client) { Aweber::Client.new }

	describe :respond do

		[200, 400].each do |rcode|

			context "with a #{rcode} response" do

				it 'should return the json object with response code' do
					response = OpenStruct.new({
						:status => rcode,
						:body =>  { :foo => 'bar' }
					})

					expect(client.respond(response)).to eq({:http_response_code => rcode, :foo => 'bar' })
				end

			end

		end

	end

end
