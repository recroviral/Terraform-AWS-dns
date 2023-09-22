# Terraform module for AWS Route53 Records

Create main.tf.json file as use module for AWS Route53 Records

##Example
```json
{
  "module": {
    "dns_name": {
      "source": "recroviral/route53-record/aws"
      "version": "1.0.1"
      "zone_id": "ZoneID",
      "records_alias": [
        {
          "name": "example.com.",
          "type": "A",
          "alias": {
            "zone_id": "HostedZoneId",
            "name": "DNSName",
            "evaluate_target_health": false
          }
        },
        {
           //add more alias records here
        },
        "records": [
        {
          "name": "example.com.",
          "type": "MX",
          "ttl": 7200,
          "value": [
            "ResourceRecords_value"
          ]
        },
        {
           //add more records here
        }
    }
}
```
Note: You will need to create provider.tf
