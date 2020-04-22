module "artemis" {
    source = "./module"

    instance_type     = "${var.instance_type}"
    security_group   = "${var.security_group}"
    Subnet1           =  "${var.Subnet1}"
    Subnet2           = "${var.Subnet2 }"
    Subnet3           = "${var.Subnet3}"
    ami               =  "${var.ami}"
    region            =  "${var.region}"
    environment       =  "${var.environment}"
    s3_bucket         =  "${var.s3_bucket}"
}
