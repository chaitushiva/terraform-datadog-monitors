resource "datadog_monitor" "disk_pressure" {
  count   = "${var.disk_pressure_enabled == "true" ? 1 : 0}"
  name    = "[${var.environment}] Kubernetes Node Disk pressure"
  message = "${coalesce(var.disk_pressure_message, var.message)}"

  type = "service check"

  query = <<EOQ
    "kubernetes_state.node.disk_pressure"${module.filter-tags.service_check}.by("kubernetescluster","node").last(6).count_by_status()
  EOQ

  thresholds = {
    warning  = "${var.disk_pressure_threshold_warning}"
    critical = 5
  }

  new_host_delay      = "${var.new_host_delay}"
  notify_no_data      = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true

  silenced = "${var.disk_pressure_silenced}"

  tags = ["env:${var.environment}", "type:caas", "provider:kubernetes", "resource:kubernetes-node", "team:claranet", "created-by:terraform", "${var.disk_pressure_extra_tags}"]
}

resource "datadog_monitor" "disk_out" {
  count   = "${var.disk_out_enabled == "true" ? 1 : 0}"
  name    = "[${var.environment}] Kubernetes Node Out of disk"
  message = "${coalesce(var.disk_out_message, var.message)}"

  type = "service check"

  query = <<EOQ
    "kubernetes_state.node.out_of_disk"${module.filter-tags.service_check}.by("kubernetescluster","node").last(6).count_by_status()
  EOQ

  thresholds = {
    warning  = "${var.disk_out_threshold_warning}"
    critical = 5
  }

  new_host_delay      = "${var.new_host_delay}"
  notify_no_data      = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true

  silenced = "${var.disk_out_silenced}"

  tags = ["env:${var.environment}", "type:caas", "provider:kubernetes", "resource:kubernetes-node", "team:claranet", "created-by:terraform", "${var.disk_out_extra_tags}"]
}

resource "datadog_monitor" "memory_pressure" {
  count   = "${var.memory_pressure_enabled == "true" ? 1 : 0}"
  name    = "[${var.environment}] Kubernetes Node Memory pressure"
  message = "${coalesce(var.memory_pressure_message, var.message)}"

  type = "service check"

  query = <<EOQ
    "kubernetes_state.node.memory_pressure"${module.filter-tags.service_check}.by("kubernetescluster","node").last(6).count_by_status()
  EOQ

  thresholds = {
    warning  = "${var.memory_pressure_threshold_warning}"
    critical = 5
  }

  new_host_delay      = "${var.new_host_delay}"
  notify_no_data      = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true

  silenced = "${var.memory_pressure_silenced}"

  tags = ["env:${var.environment}", "type:caas", "provider:kubernetes", "resource:kubernetes-node", "team:claranet", "created-by:terraform", "${var.memory_pressure_extra_tags}"]
}

resource "datadog_monitor" "ready" {
  count   = "${var.ready_enabled == "true" ? 1 : 0}"
  name    = "[${var.environment}] Kubernetes Node not ready"
  message = "${coalesce(var.ready_message, var.message)}"

  type = "service check"

  query = <<EOQ
    "kubernetes_state.node.ready"${module.filter-tags.service_check}.by("kubernetescluster","node").last(6).count_by_status()
  EOQ

  thresholds = {
    warning  = "${var.ready_threshold_warning}"
    critical = 5
  }

  new_host_delay      = "${var.new_host_delay}"
  notify_no_data      = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true

  silenced = "${var.ready_silenced}"

  tags = ["env:${var.environment}", "type:caas", "provider:kubernetes", "resource:kubernetes-node", "team:claranet", "created-by:terraform", "${var.ready_extra_tags}"]
}

resource "datadog_monitor" "kubelet_ping" {
  count   = "${var.kubelet_ping_enabled == "true" ? 1 : 0}"
  name    = "[${var.environment}] Kubernetes Node Kubelet API does not respond"
  message = "${coalesce(var.kubelet_ping_message, var.message)}"

  type = "service check"

  query = <<EOQ
    "kubernetes.kubelet.check.ping"${module.filter-tags.service_check}.by("kubernetescluster","name").last(6).count_by_status()
  EOQ

  thresholds = {
    warning  = "${var.kubelet_ping_threshold_warning}"
    critical = 5
  }

  new_host_delay      = "${var.new_host_delay}"
  notify_no_data      = true
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true

  silenced = "${var.kubelet_ping_silenced}"

  tags = ["env:${var.environment}", "type:caas", "provider:kubernetes", "resource:kubernetes-node", "team:claranet", "created-by:terraform", "${var.kubelet_ping_extra_tags}"]
}

resource "datadog_monitor" "kubelet_syncloop" {
  count   = "${var.kubelet_syncloop_enabled == "true" ? 1 : 0}"
  name    = "[${var.environment}] Kubernetes Node Kubelet sync loop that updates containers does not work"
  message = "${coalesce(var.kubelet_syncloop_message, var.message)}"

  type = "service check"

  query = <<EOQ
    "kubernetes.kubelet.check.syncloop"${module.filter-tags.service_check}.by("kubernetescluster","name").last(6).count_by_status()
  EOQ

  thresholds = {
    warning  = "${var.kubelet_syncloop_threshold_warning}"
    critical = 5
  }

  new_host_delay      = "${var.new_host_delay}"
  notify_no_data      = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true

  silenced = "${var.kubelet_syncloop_silenced}"

  tags = ["env:${var.environment}", "type:caas", "provider:kubernetes", "resource:kubernetes-node", "team:claranet", "created-by:terraform", "${var.kubelet_syncloop_extra_tags}"]
}

resource "datadog_monitor" "unregister_net_device" {
  count   = "${var.unregister_net_device_enabled == "true" ? 1 : 0}"
  name    = "[${var.environment}] Kubernetes Node Frequent unregister net device"
  type    = "event alert"
  message = "${coalesce(var.unregister_net_device_message, var.message)}"

  query = <<EOQ
    events('sources:kubernetes priority:all ${module.filter-tags.event_alert} \"UnregisterNetDevice\"').rollup('count').last('${var.unregister_net_device_timeframe}') > ${var.unregister_net_device_threshold_critical}
  EOQ

  new_host_delay = "${var.new_host_delay}"

  notify_no_data    = false
  renotify_interval = 0
  notify_audit      = false
  timeout_h         = 0
  include_tags      = true
  locked            = false

  silenced = "${var.unregister_net_device_silenced}"
  tags     = ["env:${var.environment}", "type:caas", "provider:kubernetes", "resource:kubernetes-node", "team:claranet", "created-by:terraform", "${var.unregister_net_device_extra_tags}"]
}

resource "datadog_monitor" "node_unschedulable" {
  count   = "${var.node_unschedulable_enabled == "true" ? 1 : 0}"
  name    = "[${var.environment}] Kubernetes Node unschedulable"
  type    = "metric alert"
  message = "${coalesce(var.node_unschedulable_message, var.message)}"

  query = <<EOQ
    ${var.node_unschedulable_time_aggregator}(${var.node_unschedulable_timeframe}):
      sum:kubernetes_state.node.status${module.filter-tags-unschedulable.query_alert} by {kubernetescluster,node}
    > 0
  EOQ

  thresholds {
    critical = 0
  }

  evaluation_delay = "${var.evaluation_delay}"
  new_host_delay   = "${var.new_host_delay}"

  notify_no_data      = true
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true

  silenced = "${var.node_unschedulable_silenced}"
  tags     = ["env:${var.environment}", "type:caas", "provider:kubernetes", "resource:kubernetes-node", "team:claranet", "created-by:terraform", "${var.node_unschedulable_extra_tags}"]
}
