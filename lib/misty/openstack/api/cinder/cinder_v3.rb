module Misty::Openstack::API::CinderV3
  def tag
    'Block Storage API Reference 12.0.0'
  end

  def api
{"/"=>{:GET=>[:list_all_api_versions]},
 "/v3/"=>{:GET=>[:show_api_v3_details]},
 "/v3/{project_id}/extensions"=>{:GET=>[:list_known_api_extensions]},
 "/v3/{project_id}/types/{volume_type_id}"=>
  {:PUT=>[:update_a_volume_type],
   :GET=>[:show_volume_type_detail],
   :DELETE=>[:delete_a_volume_type]},
 "/v3/{project_id}/types/{volume_type_id}/extra_specs"=>
  {:POST=>[:create_or_update_extra_specs_for_volume_type],
   :GET=>[:show_all_extra_specifications_for_volume_type]},
 "/v3/{project_id}/types/{volume_type_id}/extra_specs/{key}"=>
  {:GET=>[:show_extra_specification_for_volume_type],
   :PUT=>[:update_extra_specification_for_volume_type],
   :DELETE=>[:delete_extra_specification_for_volume_type]},
 "/v3/{project_id}/types/default"=>{:GET=>[:show_default_volume_type]},
 "/v3/{project_id}/types"=>
  {:GET=>[:list_all_volume_types], :POST=>[:create_a_volume_type]},
 "/v3/{project_id}/types/{volume_type_id}/encryption"=>
  {:GET=>[:show_an_encryption_type], :POST=>[:create_an_encryption_type]},
 "/v3/{project_id}/types/{volume_type_id}/encryption/{key}"=>
  {:GET=>[:show_encryption_specs_item]},
 "/v3/{project_id}/types/{volume_type_id}/encryption/{encryption_id}"=>
  {:DELETE=>[:delete_an_encryption_type], :PUT=>[:update_an_encryption_type]},
 "/v3/{project_id}/types/{volume_type}/action"=>
  {:POST=>
    [:add_private_volume_type_access_to_project,
     :remove_private_volume_type_access_from_project]},
 "/v3/{project_id}/types/{volume_type}/os-volume-type-access"=>
  {:GET=>[:list_private_volume_type_access_detail]},
 "/v3/{project_id}/volumes/detail"=>
  {:GET=>[:list_accessible_volumes_with_details]},
 "/v3/{project_id}/volumes"=>
  {:POST=>[:create_a_volume], :GET=>[:list_accessible_volumes]},
 "/v3/{project_id}/volumes/{volume_id}"=>
  {:GET=>[:show_a_volume_s_details],
   :PUT=>[:update_a_volume],
   :DELETE=>[:delete_a_volume]},
 "/v3/{project_id}/volumes/{volume_id}/metadata"=>
  {:POST=>[:create_metadata_for_volume],
   :GET=>[:show_a_volume_s_metadata],
   :PUT=>[:update_a_volume_s_metadata]},
 "/v3/{project_id}/volumes/{volume_id}/metadata/{key}"=>
  {:GET=>[:show_a_volume_s_metadata_for_a_specific_key],
   :DELETE=>[:delete_a_volume_s_metadata],
   :PUT=>[:update_a_volume_s_metadata_for_a_specific_key]},
 "/v3/{project_id}/volumes/summary"=>{:GET=>[:get_volumes_summary]},
 "/v3/{project_id}/volumes/{volume_id}/action"=>
  {:POST=>
    [:extend_a_volume_size,
     :reset_a_volume_s_statuses,
     :revert_volume_to_snapshot,
     :set_image_metadata_for_a_volume,
     :remove_image_metadata_from_a_volume,
     :show_image_metadata_for_a_volume,
     :attach_volume_to_a_server,
     :detach_volume_from_server,
     :unmanage_a_volume,
     :force_detach_a_volume,
     :retype_a_volume,
     :force_delete_a_volume,
     :update_a_volume_s_bootable_status,
     :upload_volume_to_image]},
 "/v3/{project_id}/manageable_volumes"=>
  {:POST=>[:manage_an_existing_volume],
   :GET=>[:list_summary_of_volumes_available_to_manage]},
 "/v3/{project_id}/manageable_volumes/detail"=>
  {:GET=>[:list_detail_of_volumes_available_to_manage]},
 "/v3/{project_id}/snapshots/detail"=>{:GET=>[:list_snapshots_and_details]},
 "/v3/{project_id}/snapshots"=>
  {:POST=>[:create_a_snapshot], :GET=>[:list_accessible_snapshots]},
 "/v3/{project_id}/snapshots/{snapshot_id}/metadata"=>
  {:GET=>[:show_a_snapshot_s_metadata],
   :POST=>[:create_a_snapshot_s_metadata],
   :PUT=>[:update_a_snapshot_s_metadata]},
 "/v3/{project_id}/snapshots/{snapshot_id}"=>
  {:GET=>[:show_a_snapshot_s_details],
   :PUT=>[:update_a_snapshot],
   :DELETE=>[:delete_a_snapshot]},
 "/v3/{project_id}/snapshot/{snapshot_id}/metadata/{key}"=>
  {:GET=>[:show_a_snapshot_s_metadata_for_a_specific_key]},
 "/v3/{project_id}/snapshots/{snapshot_id}/metadata/{key}"=>
  {:DELETE=>[:delete_a_snapshot_s_metadata],
   :PUT=>[:update_a_snapshot_s_metadata_for_a_specific_key]},
 "/v3/{project_id}/snapshots/{snapshot_id}/action"=>
  {:POST=>[:reset_a_snapshot_s_status]},
 "/v3/{project_id}/manageable_snapshots"=>
  {:POST=>[:manage_an_existing_snapshot],
   :GET=>[:list_summary_of_snapshots_available_to_manage]},
 "/v3/{project_id}/manageable_snapshots/detail"=>
  {:GET=>[:list_detail_of_snapshots_available_to_manage]},
 "/v3/{project_id}/os-volume-transfer/{transfer_id}/accept"=>
  {:POST=>[:accept_a_volume_transfer]},
 "/v3/{project_id}/os-volume-transfer"=>
  {:POST=>[:create_a_volume_transfer],
   :GET=>[:list_volume_transfers_for_a_project]},
 "/v3/{project_id}/os-volume-transfer/{transfer_id}"=>
  {:GET=>[:show_volume_transfer_detail], :DELETE=>[:delete_a_volume_transfer]},
 "/v3/{project_id}/os-volume-transfer/detail"=>
  {:GET=>[:list_volume_transfers_and_details]},
 "/v3/{project_id}/attachments/{attachment_id}"=>
  {:DELETE=>[:delete_attachment],
   :GET=>[:show_attachment_details],
   :PUT=>[:update_an_attachment]},
 "/v3/{project_id}/attachments/detail"=>
  {:GET=>[:list_attachments_with_details]},
 "/v3/{project_id}/attachments"=>
  {:GET=>[:list_attachments], :POST=>[:create_attachment]},
 "/v3/{project_id}/attachments/{attachment_id}/action"=>
  {:POST=>[:complete_attachment]},
 "/v3/{project_id}/scheduler-stats/get_pools"=>
  {:GET=>[:list_all_back_end_storage_pools]},
 "/v3/{project_id}/backups/detail"=>{:GET=>[:list_backups_with_detail]},
 "/v3/{project_id}/backups/{backup_id}"=>
  {:GET=>[:show_backup_detail],
   :DELETE=>[:delete_a_backup],
   :PUT=>[:update_a_backup]},
 "/v3/{project_id}/backups/{backup_id}/restore"=>{:POST=>[:restore_a_backup]},
 "/v3/{project_id}/backups"=>
  {:POST=>[:create_a_backup], :GET=>[:list_backups_for_project]},
 "/v3/{project_id}/backups/{backup_id}/export_record"=>
  {:GET=>[:export_a_backup]},
 "/v3/{project_id}/backups/{backup_id}/import_record"=>
  {:POST=>[:import_a_backup]},
 "/v3/{project_id}/backups/{backup_id}/action"=>
  {:POST=>[:force_delete_a_backup, :reset_a_backup_s_status]},
 "/v3/{project_id}/capabilities/{hostname}"=>
  {:GET=>[:show_all_back_end_capabilities]},
 "/v3/{project_id}/consistencygroups"=>
  {:GET=>[:list_project_s_consistency_groups],
   :POST=>[:create_a_consistency_group]},
 "/v3/{project_id}/consistencygroups/{consistencygroup_id}"=>
  {:GET=>[:show_a_consistency_group_s_details]},
 "/v3/{project_id}/consistencygroups/create_from_src"=>
  {:POST=>[:create_a_consistency_group_from_source]},
 "/v3/{project_id}/consistencygroups/{consistencygroup_id}/delete"=>
  {:POST=>[:delete_a_consistency_group]},
 "/v3/{project_id}/consistencygroups/detail"=>
  {:GET=>[:list_consistency_groups_and_details]},
 "/v3/{project_id}/consistencygroups/{consistencygroup_id}/update"=>
  {:PUT=>[:update_a_consistency_group]},
 "/v3/{project_id}/cgsnapshots/{cgsnapshot_id}"=>
  {:DELETE=>[:delete_a_consistency_group_snapshot],
   :GET=>[:show_consistency_group_snapshot_detail]},
 "/v3/{project_id}/cgsnapshots/detail"=>
  {:GET=>[:list_all_consistency_group_snapshots_with_details]},
 "/v3/{project_id}/cgsnapshots"=>
  {:GET=>[:list_all_consistency_group_snapshots],
   :POST=>[:create_a_consistency_group_snapshot]},
 "/v3/{project_id}/os-services"=>{:GET=>[:list_all_cinder_services]},
 "/v3/{project_id}/os-services/disable"=>{:PUT=>[:disable_a_cinder_service]},
 "/v3/{project_id}/os-services/disable-log-reason"=>
  {:PUT=>[:log_disabled_cinder_service_information]},
 "/v3/{project_id}/os-services/enable"=>{:PUT=>[:enable_a_cinder_service]},
 "/v3/{project_id}/os-services/get-log"=>
  {:PUT=>[:get_current_log_levels_for_cinder_services]},
 "/v3/{project_id}/os-services/set-log"=>
  {:PUT=>[:set_log_levels_of_cinder_services_dynamically]},
 "/v3/{project_id}/os-services/freeze"=>
  {:PUT=>[:freeze_a_cinder_backend_host]},
 "/v3/{project_id}/os-services/thaw"=>{:PUT=>[:thaw_a_cinder_backend_host]},
 "/v3/{project_id}/os-services/failover_host"=>
  {:PUT=>[:failover_a_cinder_backend_host]},
 "/v3/{project_id}/groups"=>{:GET=>[:list_groups], :POST=>[:create_group]},
 "/v3/{project_id}/groups/{group_id}"=>
  {:GET=>[:show_group_details], :PUT=>[:update_group]},
 "/v3/{project_id}/groups/action"=>{:POST=>[:create_group_from_source]},
 "/v3/{project_id}/groups/{group_id}/action"=>
  {:POST=>
    [:delete_group,
     :reset_group_status,
     :list_replication_targets,
     :enable_group_replication,
     :disable_group_replication,
     :failover_replication]},
 "/v3/{project_id}/groups/detail"=>{:GET=>[:list_groups_with_details]},
 "/v3/{project_id}/group_snapshots/{group_snapshot_id}"=>
  {:DELETE=>[:delete_group_snapshot], :GET=>[:show_group_snapshot_details]},
 "/v3/{project_id}/group_snapshots/detail"=>
  {:GET=>[:list_group_snapshots_with_details]},
 "/v3/{project_id}/group_snapshots"=>
  {:GET=>[:list_group_snapshots], :POST=>[:create_group_snapshot]},
 "/v3/{project_id}/group_snapshots/{group_snapshot_id}/action"=>
  {:POST=>[:reset_group_snapshot_status]},
 "/v3/{project_id}/group_types/{group_type_id}"=>
  {:PUT=>[:update_group_type],
   :GET=>[:show_group_type_details],
   :DELETE=>[:delete_group_type]},
 "/v3/{project_id}/group_types/default"=>
  {:GET=>[:show_default_group_type_details]},
 "/v3/{project_id}/group_types"=>
  {:GET=>[:list_group_types], :POST=>[:create_group_type]},
 "/v3/{project_id}/group_types/{group_type_id}/group_specs"=>
  {:POST=>[:create_or_update_group_specs_for_a_group_type],
   :GET=>[:list_group_specs_for_a_group_type]},
 "/v3/{project_id}/group_types/{group_type_id}/group_specs/{spec_id}"=>
  {:GET=>[:show_one_specific_group_spec_for_a_group_type],
   :PUT=>[:update_one_specific_group_spec_for_a_group_type],
   :DELETE=>[:delete_one_specific_group_spec_for_a_group_type]},
 "/v3/{admin_project_id}/os-hosts"=>{:GET=>[:list_all_hosts_for_a_project]},
 "/v3/{admin_project_id}/os-hosts/{host_name}"=>
  {:GET=>[:show_host_details_for_a_project]},
 "/v3/{project_id}/limits"=>{:GET=>[:show_absolute_limits_for_project]},
 "/v3/{project_id}/messages/{message_id}"=>
  {:DELETE=>[:delete_message], :GET=>[:show_message_details]},
 "/v3/{project_id}/messages"=>{:GET=>[:list_messages]},
 "/v3/{project_id}/resource_filters"=>{:GET=>[:list_resource_filters]},
 "/v3/{project_id}/qos-specs/{qos_id}/disassociate_all"=>
  {:GET=>[:disassociate_a_qos_specification_from_all_associations]},
 "/v3/{project_id}/qos-specs/{qos_id}/delete_keys"=>
  {:PUT=>[:unset_keys_in_a_qos_specification]},
 "/v3/{project_id}/qos-specs/{qos_id}/associations"=>
  {:GET=>[:get_all_associations_for_a_qos_specification]},
 "/v3/{project_id}/qos-specs/{qos_id}/associate"=>
  {:GET=>[:associate_qos_specification_with_a_volume_type]},
 "/v3/{project_id}/qos-specs/{qos_id}/disassociate"=>
  {:GET=>[:disassociate_qos_specification_from_a_volume_type]},
 "/v3/{project_id}/qos-specs/{qos_id}"=>
  {:GET=>[:show_a_qos_specification_details],
   :PUT=>[:set_keys_in_a_qos_specification],
   :DELETE=>[:delete_a_qos_specification]},
 "/v3/{project_id}/qos-specs"=>
  {:POST=>[:create_a_qos_specification], :GET=>[:list_qos_specifications]},
 "/v3/{admin_project_id}/os-quota-class-sets/{quota_class_name}"=>
  {:GET=>[:show_quota_classes_for_a_project],
   :PUT=>[:update_quota_classes_for_a_project]},
 "/v3/{admin_project_id}/os-quota-sets/{project_id}"=>
  {:GET=>[:show_quotas_for_a_project],
   :PUT=>[:update_quotas_for_a_project],
   :DELETE=>[:delete_quotas_for_a_project]},
 "/v3/{admin_project_id}/os-quota-sets/{project_id}?{usage}=True"=>
  {:GET=>[:show_quota_usage_for_a_project]},
 "/v3/{admin_project_id}/os-quota-sets/{project_id}/defaults"=>
  {:GET=>[:get_default_quotas_for_a_project]},
 "/v3/{admin_project_id}/os-quota-sets/validate_setup_for_nested_quota_use"=>
  {:GET=>[:validate_setup_for_nested_quota]},
 "v3/{project_id}/workers/cleanup"=>{:POST=>[:cleanup_services]}}
  end
end
