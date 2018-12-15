/*
 * network-peering-pair test networking variables
 */

variable "region" {
  type = "string"
}

variable "requester_cidr" {
  default = "172.16.0.0/20"
}

variable "accepter_cidr" {
  default = "172.18.0.0/16"
}

variable "cidr_access" {
  type = "list"
}

variable "ami" {
  type = "string"
}

variable "user" {
  type = "string"
}

variable "private_key_path" {
  type = "string"
}

variable "authorized_key_path" {
  type = "string"
}

variable "key_name" {
  type = "string"
}
