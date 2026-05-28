resource "datadog_synthetics_test" "app_http" {
  type    = "api"
  subtype = "http"

  name    = "App HTTP healthcheck"
  message = "App is unavailable on ${local.full_domain}"
  status  = "live"

  request_definition {
    method = "GET"
    url    = "https://${local.full_domain}"
  }

  assertion {
    type     = "statusCode"
    operator = "is"
    target   = "200"
  }

  locations = ["aws:us-east-1"]

  options_list {
    tick_every          = 60
    min_location_failed = 1
  }

  tags = [
    "app:devops-for-developers-project-77",
    "env:production",
    "managed_by:terraform"
  ]
}
