require 'misty/openstack/api/cinder/cinder_v2'
require 'misty/openstack/service_pack'

module Misty
  module Openstack
    module API
      module Cinder
        class V2
          include Misty::Openstack::API::CinderV2
          include Misty::Openstack::ServicePack

          # TODO: path for '/v2/{admin_project_id}'
          def prefix_path_to_ignore
            '/v2/{project_id}'
          end

          def service_types
            %w(volumev2)
          end
        end
      end
    end
  end
end
