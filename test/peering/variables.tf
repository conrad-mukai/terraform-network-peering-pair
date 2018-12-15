/*
 * network-peering-pair test variables
 */

variable "region" {
  type = "string"
}

variable "requester_vpc_id" {
  type = "string"
}

variable "accepter_vpc_id" {
  type = "string"
}

variable "requester_public_route_table_id" {
  type = "string"
}

variable "accepter_public_route_table_id" {
  type = "string"
}

variable "requester_private_route_table_ids" {
  type = "list"
}

variable "accepter_private_route_table_ids" {
  type = "list"
}

variable "requester_internal_security_group_id" {
  type = "string"
}

variable "accepter_internal_security_group_id" {
  type = "string"
}
