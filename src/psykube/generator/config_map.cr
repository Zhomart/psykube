class Psykube::Generator
  module ConfigMap
    private def generate_config_map
      combined_config_maps = manifest.config_map.merge(
        cluster_manifest.config_map
      )
      Psykube::Kubernetes::ConfigMap.new(
        cluster_name,
        combined_config_maps
      )
    end
  end
end
