output "arn" {
  value       = aws_acm_certificate.resource.arn
  description = <<EOF

    아래와 같이 사용할 수 있습니다.
  
    resource "aws_lb_listener" "my_listener" {
        load_balancer_arn = var.load_balancer_arn
        port              = var.port            # 443
        protocol          = var.protocol        # "HTTPS"
        ssl_policy        = var.ssl_policy      # "ELBSecurityPolicy-2016-08"
        certificate_arn   = var.certificate_arn # "your_ssl_certificate_arn"
        default_action {
            type             = var.default_action_type # "forward"
            target_group_arn = var.default_action_target_group_arn
        }
    }

  EOF
}
output "domain_validation_options" {
  value       = aws_acm_certificate.resource.domain_validation_options
  description = <<EOF
    아래와 같이 사용할 수 있습니다.

    resource "aws_acm_certificate" "my_certificate" {
        domain_name       = "your_domain_name"  # 도메인 이름 입력
        validation_method = "DNS"

        tags = {
            Name = "MyACMCertificate"
        }
    }

    resource "aws_route53_record" "acm_validation" {
        name    = aws_acm_certificate.my_certificate.domain_validation_options[0].resource_record_name
        type    = aws_acm_certificate.my_certificate.domain_validation_options[0].resource_record_type
        zone_id = "your_route53_zone_id"  # Route53 존 ID 입력

        records = [aws_acm_certificate.my_certificate.domain_validation_options[0].resource_record_value]

        ttl = 60
    }
    EOF
}
