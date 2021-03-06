require "./concerns/resource"

class Psykube::Kubernetes::ThirdPartyResource
  Resource.definition("extensions/v1beta1", "ThirdPartyResource", {
    versions: Array(Version)?,
  })
end

require "./third_party_resource/*"
