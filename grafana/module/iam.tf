resource "aws_iam_role" "grafana_admin" {
  name = "grafana_admin"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF

  tags = {
    tag-key = "tag-value"
  }
}

resource "aws_iam_instance_profile" "grafana_profile" {
  name = "grafana_profile"
  role = "${aws_iam_role.grafana_admin.name}"
}

resource "aws_iam_role_policy" "grafana_admin_policy" {
  name = "grafana_admin_policy"
  role = "${aws_iam_role.grafana_admin.id}"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "*",
            "Resource": "*"
        }
    ]
}
EOF
}
