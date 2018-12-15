/*
 * network-peering-pair variables
 */

variable "requester_vpc_id" {
  type = "string"
  description = "requester VPC ID"
}

variable "accepter_vpc_id" {
  type = "string"
  description = "accepter VPC ID"
}

variable "requester_public_route_table_id" {
  type = "string"
  description = "requester public route table ID"
}

variable "accepter_public_route_table_id" {
  type = "string"
  description = "accepter public route table ID"
}

variable "requester_private_route_table_ids" {
  type = "list"
  description = "list of requester private route table IDs"
}

variable "accepter_private_route_table_ids" {
  type = "list"
  description = "list of accepter private route table IDs"
}

variable "requester_internal_security_group_id" {
  type = "string"
  description = "requester internal security group ID"
}

variable "accepter_internal_security_group_id" {
  type = "string"
  description = "accepter internal security group ID"
}
