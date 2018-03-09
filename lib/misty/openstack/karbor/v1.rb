require 'misty/openstack/karbor/karbor_v1'
require 'misty/openstack/service_pack'

module Misty
  module Openstack
    module Karbor
      class V1
        include Misty::Openstack::KarborV1
        include Misty::Openstack::ServicePack

        def service_types
          %w(data-protection data-protection-orchestration)
        end
      end
    end
  end
end
