require "../../concerns/mapping"
require "../../shared/metadata"
require "../../pod"

class Psykube::Kubernetes::PodTemplate
  class Template
    Kubernetes.mapping({
      metadata: Shared::Metadata,
      spec:     Pod::Spec,
    })

    def initialize(name : String)
      @metadata = Shared::Metadata.new
      @metadata.labels = {"app" => name}
      @spec = Pod::Spec.new
    end
  end
end
