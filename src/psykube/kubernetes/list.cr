require "./concerns/resource"

require "./cluster"
require "./component_status"
require "./config_map"
require "./daemon_set"
require "./deployment"
require "./endpoint"
require "./event"
require "./horizontal_pod_autoscaler"
require "./ingress"
require "./job"
require "./limit_range"
require "./namespace"
require "./network_policy"
require "./node"
require "./persistent_volume"
require "./persistent_volume_claim"
require "./pod"
require "./pod_security_policy"
require "./pod_template"
require "./secret"
require "./service"

class Psykube::Kubernetes::List
  include Resource
  alias ListableTypes = Cluster |
                        ComponentStatus |
                        ConfigMap |
                        DaemonSet |
                        Deployment |
                        Endpoint |
                        Event |
                        HorizontalPodAutoscaler |
                        Ingress |
                        Job |
                        LimitRange |
                        Namespace |
                        NetworkPolicy |
                        Node |
                        PersistentVolume |
                        PersistentVolumeClaim |
                        Pod |
                        PodSecurityPolicy |
                        PodTemplate |
                        Secret |
                        Service

  delegate :select, :[], :[]?, :find, :unshift, to: @items

  definition("v1", "List", {
    items:            {type: Array(ListableTypes), default: [] of ListableTypes},
    resource_version: String?,
    self_link:        String?,
  })

  def initialize(&block : List -> _)
    initialize
    yield self
  end

  def initialize(items : Array(ListableTypes?))
    initialize
    concat(items)
  end

  def concat(items : Nil)
  end

  def concat(items : Array(ListableTypes?))
    items.each { |item| self << item }
  end

  def <<(item : ListableTypes)
    @items << item
  end

  def <<(item : Nil)
  end

  def clean!
    @items.each(&.clean!)
    self
  end
end
