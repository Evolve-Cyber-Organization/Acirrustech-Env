resource "aws_instance" "prod" {
    ami               = "${var.ami}"
    #region            =  "${var.region}"
    instance_type     = "t2.medium"
    security_groups    = ["${var.sg_group}"]
    key_name          = "${aws_key_pair.test_key.key_name}"
    user_data         = "${file("userdata_file")}"
}
