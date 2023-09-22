variable "zone_id" {
  type = string
}

variable "records" {
  type = list(object({
    Name  = string
    Type  = string
    TTL   = number
    Value = list(string)
  }))
  default = []
}

variable "records_alias" {
  type = list(object({
    Name  = string
    Type  = string
    alias = object({
      DNSName              = string
      HostedZoneId         = string
      EvaluateTargetHealth = string
    })
  }))
  default = []
}
