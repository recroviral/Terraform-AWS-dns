variable "zone_id" {
  type = string
}

variable "records" {
  type = list(object({
    name = string
    type = string
    ttl = number
    value = list(string)
  }))
  default = []
}

variable "records_alias" {
  type = list(object({
    name = string
    type = string
    alias = object({
      name = string
      zone_id = string
      evaluate_target_health = string
    })
  }))
  default = []
}
