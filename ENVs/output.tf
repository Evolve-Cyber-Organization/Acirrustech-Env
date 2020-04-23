output "this_autoscaling_group_name" {
  description = "The autoscaling group name"
  value       = "${module.asg.this_autoscaling_group_name}"
}