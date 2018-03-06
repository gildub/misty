require 'test_helper'

describe 'Networking Service Neutron v2.0 features' do
  let(:auth) do
    {
      :url                => 'http://192.0.2.6:5000',
      :user               => 'admin',
      :password           => 'QJdEmBzzEJpfpeRY6e3TEk7TW',
      :project            => 'admin',
      :project_domain_id  => 'default',
      :domain             => 'default'
    }
  end

  it 'GET/POST/PUT/DELETE requests' do
    VCR.use_cassette 'networking using neutron v2.0' do
      cloud = Misty::Cloud.new(:auth => auth, :networking => {:api_version => 'v2.0'})

      # POST with body data
      data = Misty.to_json('network' => { 'name': 'test_network' })
      response = cloud.networking.create_network(data)
      response.code.must_equal '201'
      id = response.body['network']['id']
      id.wont_be_empty

      # GET
      response = cloud.networking.list_networks
      response.code.must_equal '200'
      response.body['networks'].size.must_equal 2

      # GET with URI value
      response = cloud.networking.show_network_details(id)
      response.code.must_equal '200'
      response.body['network']['name'].must_equal 'test_network'

      # PUT with URI value and body data
      data = Misty.to_json('network' => { 'name': 'test_updated_network' })
      response = cloud.networking.update_network(id, data)
      response.code.must_equal '200'
      response.body['network']['name'].must_equal 'test_updated_network'

      # DELETE with URI value
      response = cloud.networking.delete_network(id)
      response.code.must_equal '204'
    end
  end
end
