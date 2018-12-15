# Network Peering Pair

Peer 2 VPCs that are in the same account and region.

## Description

This peers 2 VPCs created with the network module:

    https://github.com/conrad-mukai/terraform-network.git

It creates the peering connection and calls the network-peering module:

    https://github.com/conrad-mukai/terraform-network-peering.git

for the requester and accepter VPCs.

## Manual Steps

The Route53 zone must be associated with the peer VPC manually because the
Terraform resource `aws_route53_zone_association` updates the
`aws_route53_zone` causing a cycle of updates.

## Variables

| Name | Description | Default |
| ---- | ----------- | ------- |
| `accepter_internal_security_group_id` | accepter internal security group ID | |
| `accepter_private_route_table_ids` | list of accepter private route table IDs | |
| `accepter_public_route_table_id` | accepter public route table ID | |
| `accepter_vpc_id` | accepter VPC ID | |
| `requester_internal_security_group_id` | requester internal security group ID | |
| `requester_private_route_table_ids` | list of requester private route table IDs | |
| `requester_public_route_table_id` | requester public route table ID | |
| `requester_vpc_id` | requester VPC ID | |

## Outputs

| Name | Description |
| ---- | ----------- |
| `vpc_peering_connection_id` | VPC peering connection ID |
