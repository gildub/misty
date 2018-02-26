require 'misty/config'
require 'misty/auth/auth_v2'
require 'misty/auth/auth_v3'
require 'misty/http/header'

module Misty

  # Cloud is the OpenStack cloud entry point
  #
  # ==== Attributes
  #
  # * +args+ - Hash of credentials and configuration parameters
  #
  # ==== Examples
  # Initialize with authentication
  #   require 'misty'
  #    auth = {
  #      :url                => 'http://localhost:5000',
  #      :user               => 'admin',
  #      :password           => 'secret',
  #      :domain             => 'default',
  #      :project            => 'admin',
  #      :project_domain_id  => 'default'
  #    }
  #    cloud = Misty::Cloud.new(:auth => auth, :log_file => './misty.log')
  #
  # Consume services
  #    pp openstack.compute.list_servers.body
  #    pp openstack.compute.list_flavors.body
  #    networks = cloud.networking.list_networks
  #    first_network_id = networks.body['networks'][0]['id']
  #    first_network = cloud.networking.show_network_details(first_network_id)
  #    network = Misty.to_json(:network => {:name => 'misty-example'})
  #    cloud.network.create_network(network)
  #    v1 = cloud.baremetal.show_v1_api
  #
  # A V2 style authentication using tenant (no project nor domain)
  #    auth_v2 = {
  #      :url      => 'http://localhost:5000',
  #      :user     => 'admin',
  #      :password => 'secret',
  #      :tenant   => 'admin',
  #    }
  #    cloud = Misty::Cloud.new(:auth => auth_v2)
  #    cloud.identity(:base_path => '').list_users
  #
  # Authenticate using a V3 style and force the identity service to use v2.0
  #    cloud = Misty::Cloud.new(:auth => auth_v3)
  #    cloud.identity(:api_version => 'v2.0').list_tenants

  class Cloud
    attr_reader :auth

    def self.dot_to_underscore(val)
      val.gsub(/\./,'_')
    end

    def initialize(args)
      @config = Misty::Config.new(args)
      @auth = Misty::Auth.factory(args[:auth], @config)
    end

    def build_service(args)
      service = Misty.services.find {|service| service.name == args[:service]}
      args.delete(:service)
      version = self.class.dot_to_underscore(service.version(args[:api_version]))
      klass = Object.const_get("Misty::Openstack::#{service.project.capitalize}::#{version.capitalize}")
      klass.new(@auth, @config, args)
    end

    def application_catalog(args = {})
      args[:service] = :application_catalog
      @application_catalog ||= build_service(args)
    end

    def alarming(args = {})
      args[:service] = :alarming
      @alarming ||= build_service(args)
    end

    def backup(args = {})
      args[:service] = :backup
      @backup ||= build_service(args)
    end

    def baremetal(args = {})
      args[:service] = :baremetal
      @baremetal ||= build_service(args)
    end

    def block_storage(args = {})
      args[:service] = :block_storage
      @block_storage ||= build_service(args)
    end

    def clustering(args = {})
      args[:service] = :clustering
      @clustering ||= build_service(args)
    end

    def compute(args = {})
      args[:service] = :compute
      @compute ||= build_service(args)
    end

    def container_infrastructure_management(args = {})
      args[:service] = :container_infrastructure_management
      @container_infrastructure_management ||= build_service(args)
    end

    def data_processing(args = {})
      args[:service] = :data_processing
      @data_processing ||= build_service(args)
    end

    def data_protection_orchestration(args = {})
      args[:service] = :data_protection_orchestration
      @data_protection_orchestration ||= build_service(args)
    end

    def database(args = {})
      args[:service] = :database
      @database ||= build_service(args)
    end

    def dns(args = {})
      args[:service] = :dns
      @dns ||= build_service(args)
    end

    def identity(args = {})
      args[:service] = :identity
      @identity ||= build_service(args)
    end

    def image(args = {})
      args[:service] = :image
      @image ||= build_service(args)
    end

    def load_balancer(args = {})
      args[:service] = :load_balancer
      @load_balancer ||= build_service(args)
    end

    def messaging(args = {})
      args[:service] = :messaging
      @messaging ||= build_service(args)
    end

    def metering(args = {})
      args[:service] = :metering
      @metering ||= build_service(args)
    end

    def networking(args = {})
      args[:service] = :networking
      @networking ||= build_service(args)
    end

    def nfv_orchestration(args = {})
      args[:service] = :nfv_orchestration
      @nfv_orchestration ||= build_service(args)
    end

    def object_storage(args = {})
      args[:service] = :object_storage
      @object_storage ||= build_service(args)
    end

    # ==== Example
    #
    #    heat_template = {
    #      "files": {},
    #      "disable_rollback": true,
    #      "parameters": {
    #        "flavor": "m1.tiny"
    #      },
    #      "stack_name": "test_stack",
    #      "template": {
    #        "heat_template_version": "2013-05-23",
    #        "description": "Template to test heat",
    #        "parameters": {
    #          "flavor": {
    #            "default": "m1.small",
    #            "type": "string"
    #          }
    #        },
    #        "resources": {
    #          "hello_world": {
    #            "type": "OS::Nova::Server",
    #            "properties": {
    #              "flavor": { "get_param": "flavor" },
    #              "image": "50fd6f2b-d9f0-41b6-b0a9-4482bfe61914",
    #              "user_data": "#!/bin/bash -xv\necho \"hello world\" &gt; /root/hello-world.txt\n"
    #            }
    #          }
    #        }
    #      },
    #      "timeout_mins": 60
    #    }
    #
    #    cloud = Misty::Cloud.new(:auth => { ... })
    #    data_heat_template = Misty.to_json(heat_template)
    #    response = cloud.orchestration.create_stack(data_heat_template)
    #    id = response.body['stack']['id']
    #
    #    stack = cloud.orchestration.show_stack_details('test_stack', id)
    #    pp stack.body
    #
    def orchestration(args = {})
      args[:service] = :orchestration
      @orchestration ||= build_service(args)
    end

    def search(args = {})
      args[:service] = :search
      @search ||= build_service(args)
    end

    def shared_file_systems(args = {})
      args[:service] = :shared_file_systems
      @shared_file_systems ||= build_service(args)
    end

    alias domain_name_server dns
    alias volume block_storage

    private

    def method_missing(method_name)
      services_avail = []
      Misty.services.names.each do |service_name|
        services_avail << service_name if /#{method_name}/.match(service_name)
      end

      if services_avail.size == 1
        self.send(services_avail[0])
        return self.instance_variable_get("@#{services_avail[0]}")
      elsif services_avail.size > 1
        raise NoMethodError, "Ambiguous Cloud Service: #{method_name}"
      else
        raise NoMethodError, "No such Cloud Service: #{method_name}"
      end
    end
  end
end
