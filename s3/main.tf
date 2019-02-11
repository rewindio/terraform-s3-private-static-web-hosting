
################################################################################################################
## Configure the bucket and static website hosting
################################################################################################################
data "template_file" "bucket_policy" {
  template = "${file("${path.module}/s3_ip_restrict_policy.json")}"

  vars {
    bucket = "${var.full_domain}"
    allowed_ip = "${var.allowed_ip}"
  }
}

resource "aws_s3_bucket" "website_bucket" {
  bucket  = "${var.full_domain}"
  acl     = "public-read"
  policy   = "${data.template_file.bucket_policy.rendered}"

  website {
    index_document = "${var.index_document}"
    error_document = "${var.error_document}"
    routing_rules  = "${var.routing_rules}"
  }

  force_destroy = "${var.force_destroy}"

  logging {
    target_bucket = "${var.s3_logging_bucket}"
    target_prefix = "${var.full_domain}/"
  }

  tags = "${merge("${var.tags}",map("Name", "${var.full_domain}"))}"
}