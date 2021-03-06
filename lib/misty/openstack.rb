module Misty
  module Openstack
    SERVICES = [
      {:type=>:application_catalog, :project=>:murano, :versions=>["v1"]},
      {:type=>:alarming, :project=>:aodh, :versions=>["v2"]},
      {:type=>:backup, :project=>:freezer, :versions=>["v1"]},
      {:type=>:baremetal, :project=>:ironic, :versions=>["v1"], :microversion=>"1.32"},
      {:type=>:block_storage, :project=>:cinder, :versions=>["v3", "v2", "v1"], :microversion=>"3.44"},
      {:type=>:clustering, :project=>:senlin, :versions=>["v1"]},
      {:type=>:compute, :project=>:nova, :versions=>["v2.1"], :microversion=>"2.60"},
      {:type=>:container_infrastructure_management, :project=>:magnum, :versions=>["v1"], :microversion=>"1.4"},
      {:type=>:container_service, :project=>:zun, :versions=>["v1"]},
      {:type=>:data_processing, :project=>:sahara, :versions=>["v1.1"]},
      {:type=>:data_protection_orchestration, :project=>:karbor, :versions=>["v1"]},
      {:type=>:database, :project=>:trove, :versions=>["v1.0"]},
      {:type=>:dns, :project=>:designate, :versions=>["v2"]},
      {:type=>:event, :project=>:panko, :versions=>["v2"]},
      {:type=>:identity, :project=>:keystone, :versions=>["v3", "v2.0"]},
      {:type=>:image, :project=>:glance, :versions=>["v2", "v1"]},
      {:type=>:instance_ha, :project=>:masakari, :versions=>["v1.0"]},
      {:type=>:key_manager, :project=>:barbican, :versions=>["v1"]},
      {:type=>:load_balancer, :project=>:octavia, :versions=>["v2.0"]},
      {:type=>:metric, :project=>:gnocchi, :versions=>["v1"]},
      {:type=>:messaging, :project=>:zaqar, :versions=>["v2"]},
      {:type=>:metering, :project=>:ceilometer, :versions=>["v2"]},
      {:type=>:monitoring, :project=>:monasca, :versions=>["v2.0"]},
      {:type=>:network, :project=>:neutron, :versions=>["v2.0"]},
      {:type=>:nfv_orchestration, :project=>:tacker, :versions=>["v1.0"]},
      {:type=>:object_storage, :project=>:swift, :versions=>["v1"]},
      {:type=>:orchestration, :project=>:heat, :versions=>["v1"]},
      {:type=>:placement, :project=>:placement, :versions=>["v2.1"], :microversion=>"2.60"},
      {:type=>:reservation, :project=>:blazar, :versions=>["v1"]},
      {:type=>:resource_optimization, :project=>:watcher, :versions=>["v1"]},
      {:type=>:search, :project=>:searchlight, :versions=>["v1"]},
      {:type=>:shared_file_systems, :project=>:manila, :versions=>["v2"], :microversion=>"2.40"},
      {:type=>:workflow, :project=>:mistral, :versions=>["v2"]}
    ]
  end
end
