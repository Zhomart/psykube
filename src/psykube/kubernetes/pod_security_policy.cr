require "./concerns/resource"

class Psykube::Kubernetes::PodSecurityPolicy
  Resource.definition("extensions/v1beta1", "PodSecurityPolicy", {
    spec: Spec?,
  })
end

require "./pod_security_policy/*"
