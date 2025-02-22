data "aws_route53_zone" "sbx_hashidemos_io" {
  name = "${var.prefix}.sbx.hashidemos.io"
}


resource "aws_route53_record" "splunk" {
  zone_id = data.aws_route53_zone.sbx_hashidemos_io.zone_id
  name    = "${var.splunk_domain}.${var.prefix}.sbx.hashidemos.io"
  type    = "A"
  ttl     = "300"
  records = [aws_eip.splunk.public_ip]
}
