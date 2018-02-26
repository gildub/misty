module Misty
  module Client
    class Options
      attr_accessor :base_path, :base_url, :headers, :interface, :region_id,
                    :service_names, :ssl_verify_mode, :version

      def setup(params = {})
        @base_path           = params[:base_path]       ? params[:base_path] : nil
        @base_url            = params[:base_url]        ? params[:base_url] : nil
        @headers             = params[:headers]         ? params[:headers] : {}
        @interface           = params[:interface]       ? params[:interface] : @config.interface
        @region_id           = params[:region_id]       ? params[:region_id] : @config.region_id
        @service_names       = params[:service_name]    ? service_names << params[:service_name] : service_names
        @ssl_verify_mode     = params[:ssl_verify_mode].nil? ? @config.ssl_verify_mode : params[:ssl_verify_mode]
        @version             = params[:version]         ? params[:version] : 'CURRENT'

        unless INTERFACES.include?(@interface)
          raise InvalidDataError, "Options ':interface' must be one of #{INTERFACES}"
        end

        unless @ssl_verify_mode == !!@ssl_verify_mode
          raise InvalidDataError, "Options ':ssl_verify_mode' must be a boolean"
        end
      end
    end

    class InvalidDataError < StandardError; end

    INTERFACES = %w{admin public internal}

    attr_reader :headers, :microversion

    # ==== Options
    #
    # * :api_version
    #   Type: String
    #   Default: The latest supported version - See Misty.services for other versions.
    # * :base_path
    #   Allows to force the base path for every URL requests.
    #   Type: String
    # * :base_url
    #   Allows to force the base URL for every requests.
    #   Type: String
    # * :headers
    #   Optional headers
    #   Type: Hash
    # * :interface
    #   Allows to provide an alternate interface. Allowed values are "public", "internal" or "admin"
    #   Type: String
    #   Default: Determined from global value
    # * :region_id
    #   Type: String
    #   Default: Determined from global value
    # * :service_names
    #   Allows to use a difference name for the service. For instance "identity3" for the identity service.
    #   Type: String
    #   Default: Determined from Misty.services
    # * :ssl_verify_mode
    #   Type: Boolean
    #   Default: Determined from global value
    # * :version
    #   Version to be used when microversion is supported by the service.
    #   Type: String
    #   Allowed values: "CURRENT", "LATEST", "SUPPORTED", or a version number such as "2.0" or "3"
    #   Default: `"CURRENT"`
    #
    # ==== Examples
    #   openstack = Misty::Cloud.new(:auth => auth, :log_level => 0, :identity => {:region_id => 'regionTwo'}, :compute => {:version => '2.27', :interface => 'admin'})
    def initialize(auth, config, options = {})
      @auth = auth
      @config = config
      @options = Misty::Client::Options.new(options)
      @uri = URI.parse(@auth.get_url(@options.service_names, @options.region_id, @options.interface))
      @base_path = @options.base_path ? @options.base_path : @uri.path
      @base_path = @base_path.chomp('/')
      @version = nil
      @microversion = false
      @headers = Misty::HTTP::Header.new(@config.headers.get.clone)
      @headers.add(microversion_header) if microversion
      @headers.add(@options.headers) unless @options.headers.empty?
    end

    # When a catalog provides a base path and the Service API definition containts the generic equivalent as prefix
    # then the preifx is redundant and must be removed from the path.
    #
    # To use Mixing classes must override
    #
    # For exampe, if a Catalog is defined with
    # 'http://192.0.2.21:8004/v1/48985e6b8da145699d411f12a3459fc'
    # and Service API resource has '/v1/{tenant_id}/stacks'
    # then the path prefix is ignored and path is only +/stacks+
    def prefix_path_to_ignore
      ''
    end

    # Provides requests available for current service
    #
    # ==== Example
    #
    #  # Output truncated
    #  cloud.compute.requests
    #  => [:add_a_single_tag,
    #   :add_associate_fixed_ip_addfixedip_action_deprecated,
    #   :add_associate_floating_ip_addfloatingip_action_deprecated,
    #   :add_flavor_access_to_tenant_addtenantaccess_action,
    #   :add_host,
    #   :add_network,
    #   :add_security_group_to_a_server_addsecuritygroup_action,
    #   :associate_host_deprecated,
    #   :attach_a_volume_to_an_instance,
    #   :bulk_delete_floating_ips,
    #   :capacities,
    #   :change_administrative_password_changepassword_action,
    #   :check_tag_existence,
    #   :clear_admin_password,
    #   :confirm_resized_server_confirmresize_action,
    #   :create_agent_build,
    #   :create_aggregate,
    #   :create_allocate_floating_ip_address,
    #   :create_assisted_volume_snapshots,
    #   :create_cell,
    #   :create_cloudpipe,
    #   :create_console]

    def requests
      requests_api + requests_custom
    end

    private

    def baseclass
      self.class.to_s.split('::')[-1]
    end

    def requests_api
      @requests_api_list ||= begin
        list = []
        api.each do |_path, verbs|
          verbs.each do |_verb, requests|
            list << requests
          end
        end
        list.flatten!
      end
    end

    def requests_custom
      []
    end
  end
end
