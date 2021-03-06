require 'test_helper'

def validate_service(service)
  service.must_be_kind_of Misty::Service
  service.type.must_be_kind_of Symbol
  service.project.must_be_kind_of Symbol
end

def validate_versions(service)
  service.versions.must_be_kind_of Array
  service.versions.each do |version|
    version.must_be_kind_of String
  end
end

def validate_microversion(service)
  service.microversion.must_be_kind_of String
end

describe Misty do
  describe '#set_services' do
    it 'has alarming service' do
      service = Misty::services.find { |s| s.type == :alarming}
      validate_service(service)
      validate_versions(service)
    end

    it 'has baremetal service' do
      service = Misty::services.find { |s| s.type == :baremetal}
      validate_service(service)
      validate_microversion(service)
    end

    it 'has block_storage service' do
      service = Misty::services.find { |s| s.type == :block_storage}
      validate_service(service)
      validate_versions(service)
      validate_microversion(service)
    end

    it 'has clustering service' do
      service = Misty::services.find { |s| s.type == :clustering}
      validate_service(service)
      validate_versions(service)
    end

    it 'has compute service' do
      service = Misty::services.find { |s| s.type == :compute}
      validate_service(service)
      validate_microversion(service)
    end

    it 'has container_infrastructure_management service' do
      service = Misty::services.find { |s| s.type == :container_infrastructure_management}
      validate_service(service)
      validate_microversion(service)
    end

    it 'has data_processing service' do
      service = Misty::services.find { |s| s.type == :data_processing}
      validate_service(service)
      validate_versions(service)
    end

    it 'has data_protection service' do
      service = Misty::services.find { |s| s.type == :data_protection_orchestration}
      validate_service(service)
      validate_versions(service)
    end

    it 'has database service' do
      service = Misty::services.find { |s| s.type == :database}
      validate_service(service)
      validate_versions(service)
    end

    it 'has dns service' do
      service = Misty::services.find { |s| s.type == :dns}
      validate_service(service)
      validate_versions(service)
    end

    it 'has identity service' do
      service = Misty::services.find { |s| s.type == :identity}
      validate_service(service)
      validate_versions(service)
    end

    it 'has image service' do
      service = Misty::services.find { |s| s.type == :image}
      validate_service(service)
      validate_versions(service)
    end

    it 'has messaging service' do
      service = Misty::services.find { |s| s.type == :messaging}
      validate_service(service)
      validate_versions(service)
    end

    it 'has metering service' do
      service = Misty::services.find { |s| s.type == :metering}
      validate_service(service)
      validate_versions(service)
    end

    it 'has network service' do
      service = Misty::services.find { |s| s.type == :network}
      validate_service(service)
      validate_versions(service)
    end

    it 'has object_storage service' do
      service = Misty::services.find { |s| s.type == :object_storage}
      validate_service(service)
      validate_versions(service)
    end

    it 'has orchestration service' do
      service = Misty::services.find { |s| s.type == :orchestration}
      validate_service(service)
      validate_versions(service)
    end

    it 'has search service' do
      service = Misty::services.find { |s| s.type == :search}
      validate_service(service)
      validate_versions(service)
    end

    it 'has shared_file_systems service' do
      service = Misty::services.find { |s| s.type == :shared_file_systems}
      validate_service(service)
      validate_microversion(service)
    end

    describe '#services' do
      it 'returns Services' do
        services = Misty::services
        services.must_be_kind_of Misty::Services
      end
    end
  end

  describe 'Misty::Helper' do
    describe '#json_encode?' do
      it 'true with a Array type' do
        Misty::Helper.json_encode?([]).must_equal true
      end

      it 'true with a Hash type' do
        Misty::Helper.json_encode?({}).must_equal true
      end

      it 'true with a JSON String type' do
        Misty::Helper.json_encode?('{"JSON_Key": "JSON_Value"}').must_equal true
      end

      it 'false with a non JSON String type' do
        Misty::Helper.json_encode?("Just a string").must_equal false
      end
    end

    describe '#to_json' do
      it 'returns a JSON string when using a Ruby hash' do
        Misty::Helper.to_json({'key' => 'val'}).must_be_kind_of String
      end

      it 'returns same string when using a string' do
        data = "{\"key\": \"val\"}"
        response = Misty::Helper.to_json(data)
        response.must_be_kind_of String
        response.must_equal data
      end

      it 'fails when using a string with non JSON data' do
        data = 'key;val'
        proc do
          response = Misty::Helper.to_json(data)
        end.must_raise JSON::ParserError
      end
    end
  end
end
