module "grafana" {
   source   =  "./module"
   domain   =  "${var.domain}"
   zone_id  =  "${var.zone_id}"
   region   =  "${var.region}"
   instance_type  =  "${var.instance_type}"
}
